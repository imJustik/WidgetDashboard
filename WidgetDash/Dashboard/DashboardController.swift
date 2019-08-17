//  Created by Илья Кузнецов on 30/04/2019.

import UIKit

class Dashboard: UIViewController {
    let interactor: DashboardInteractor
    let widgetActionHandler: WidgetIncomingEventNotifier?
    lazy var contentView = DashboardView ()

    var state: State {
        didSet(oldState) {
            switch (oldState, state) {
            case (_, .initial):
                createWidgets()
            case let (_, .displayWidgets(widgets)):
                widgets.forEach {
                    addChild($0)
                    contentView.stackView.addArrangedSubview($0.view)
                    $0.didMove(toParent: self)
                }
            }
        }
    }

    init(interactor: DashboardInteractor,
         state: State,
         widgetActionHandler: WidgetIncomingEventNotifier) {
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

extension Dashboard: Widget3ActionDelegate {
    func reloadFirstTapped() {
        widgetActionHandler?.notifySubscribers(of: .reloadFaces)
    }

    func reloadBothTapped() {
        widgetActionHandler?.notifySubscribers(of: .reloadBoth)
    }
}

extension Dashboard {
    enum State {
        case initial
        case displayWidgets([WidgetViewController])
    }
}

extension Dashboard: Widget2ActionDelegate {}

extension Dashboard: Widget1ActionDelegate {

    func cellWasTapped(index: Int) {
        print(index)
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

extension Dashboard: WidgetContainerDelegate {
    func layout() {
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }

    func navigate(to route: String) {
        let alert = UIAlertController(
            title: "Переходим на \(route)",
            message: nil,
            preferredStyle: .alert)
        let action =  UIAlertAction(title: "Хорошо", style: .cancel) {(action: UIAlertAction!) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

extension Dashboard: Widget4ActionDelegate {
    func layout2() {
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }
}
