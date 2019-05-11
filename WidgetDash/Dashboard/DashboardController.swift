//  Created by Илья Кузнецов on 30/04/2019.

//TODO: подумать, где будет WidgetFactory, может имеет смысл инжектировать в VC сразу список виджетов?

import UIKit

class Dashboard: UIViewController {
    let interactor: DashboardInteractor

   lazy var contentView = DashboardView ()

    var state: State {
        didSet(oldState) {
            switch (oldState, state) {
            case (_, .initial):
                print("set widgets")
                createWidgets()
            case let (_, .displayWidgets(widgets)):
                print("display \(widgets.count) widgets")
                for var widget in widgets {
                    guard let widgetViewController = widget as? WidgetViewController else { return }
                    //                    let container = WidgetContainerViewController(widget: widgetViewController)
                    addChild(widgetViewController)
                    widget.externalDelegate = self
                    contentView.stackView.addArrangedSubview(widgetViewController.view)
                    widgetViewController.didMove(toParent: self)
                }
            }
        }
    }


    init(interactor: DashboardInteractor, state: State) {
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
        // Создаем запрос к интерактору для создания виджетов
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
    }
}

extension Dashboard: Widget1ExternalDelegate {
    func widget1ButtonTapped() {
        print("refresh 1 in dashboard")
    }
}

extension Dashboard: Widget2ExternalDelegate {
    func widget2ButtonTapped() {
        print("refresh 2 in dashboard")
    }
}

extension Dashboard: Widget3ExternalDelegate {
    func widget3buttonTapped() {
        print("refresh 3 in dashboard")
    }
}

extension Dashboard {
    enum State {
        case initial
        case displayWidgets([Widget])
    }
}
