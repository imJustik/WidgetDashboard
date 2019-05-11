import UIKit

typealias WidgetViewController = Widget & UIViewController

/// Контроллер-контейнер для виджетов дашборда
final class WidgetContainerViewController: UIViewController {
    lazy var containerView = WidgetContainerView()
    let widget: WidgetViewController

    init(widget: WidgetViewController) {
        self.widget = widget
        super.init(nibName: nil, bundle: nil)
        addChild(widget)
    }

    public required init?(coder _: NSCoder) {
        fatalError()
    }

    public override func loadView() {
        view = containerView
//        if let widgetView = widget.view as? WidgetView {
//            containerView.setSelectable(widgetView.isSelectable)
//            containerView.setSeparatorHidden(widgetView.isSeparatorHidden)
//            containerView.setSeparatorInsets(widgetView.separatorInsets)
//            if widgetView.isSelectable {
//                widget.view.isUserInteractionEnabled = false
//                containerView.addTarget(self, action: #selector(selectWidget), for: .touchUpInside)
//            }
//        } else {
//            containerView.setSelectable(true)
//        }

        containerView.configure(with: widget.view)
        widget.didMove(toParent: self)
    }

    @objc
    func selectWidget() {
        print("select widget")
        //widget.didBecomeSelected()
    }
}
