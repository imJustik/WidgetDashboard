//  Created by Илья Кузнецов on 30/04/2019.

//TODO: подумать, где будет WidgetFactory, может имеет смысл инжектировать в VC сразу список виджетов?

import UIKit

class Dashboard: UIViewController {
    let interactor: DashboardInteractor
    let widgetActionHandler: WidgetIncomingHandler?
    lazy var contentView = DashboardView ()

    var state: State {
        didSet(oldState) {
            switch (oldState, state) {
            case (_, .initial):
                createWidgets()
            case let (_, .displayWidgets(widgets)):
                for var widget in widgets {
                    guard let widgetViewController = widget as? WidgetViewController else { return }
                    addChild(widgetViewController)
                    widget.externalDelegate = self
                    contentView.stackView.addArrangedSubview(widgetViewController.view)
                    widgetViewController.didMove(toParent: self)
                }
            }
        }
    }


    init(interactor: DashboardInteractor,
         state: State,
         widgetActionHandler: WidgetIncomingHandler) {
        self.widgetActionHandler = widgetActionHandler
        self.interactor = interactor
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = UIView()
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createWidgets() {
        let request = DashboardFlow.SetupWidgets.Request()
        interactor.setupWidgets(request: request)
    }

    func display(viewModel: DashboardFlow.SetupWidgets.ViewModel) {
        self.state = viewModel.state
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createWidgets()

        contentView.refreshControl.addTarget(
            self,
            action: #selector(updateWidgets),
            for: .valueChanged
        )
    }

    @objc func updateWidgets() {
        children.compactMap {
            $0 as? Reloadable
            }.forEach { $0.reload() }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.contentView.refreshControl.endRefreshing()
        }
    }
}

extension Dashboard: Widget1ExternalDelegate {
    func cellWasTapped(index: Int) {
        let alert = UIAlertController(
            title: "Нажали на Петю \(index)",
            message: nil,
            preferredStyle: .alert)
        let action =  UIAlertAction(title: "Cancel", style: .cancel) {(action: UIAlertAction!) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

extension Dashboard: Widget2ExternalDelegate {
    func widget2ButtonTapped() {
        print("refresh 2 in dashboard")
    }
}

extension Dashboard: Widget3ExternalDelegate {
    func widget3buttonTapped() {
        widgetActionHandler?.updateSubscribers(for: .reloadBoth)
    }
}

extension Dashboard {
    enum State {
        case initial
        case displayWidgets([Widget])
    }
}
