import UIKit

protocol WidgetContainerDelegate: AnyObject {
    func navigate(to controller: UIViewController)
}

typealias WidgetViewController = Widget & UIViewController

class WidgetContainerViewController: WidgetViewController {
    var externalDelegate: WidgetActionDelegate?
    let uid: UUID = UUID()

    var containerView: WidgetContainerView
    let widget: WidgetViewController

    var route: UIViewController?

    init(widget: WidgetViewController,
         externalDelegate: WidgetActionDelegate? = nil,
         title: String,
         route: UIViewController? = nil) {
        self.widget = widget
        self.externalDelegate = externalDelegate
        self.route = route
        containerView = WidgetContainerView(title: title, needAction: route != nil)
        super.init(nibName: nil, bundle: nil)
        containerView.delegate = self
    }

    required init?(coder _: NSCoder) {
        fatalError()
    }

    override func loadView() {
        view = containerView
        addChild(widget)
        widget.didMove(toParent: self)
        containerView.add(view: widget.view)
    }
}

extension WidgetContainerViewController: ContainerViewDelegate {
    func tapButton() {
        guard let route = route else { return }
        (externalDelegate as? WidgetContainerDelegate)?.navigate(to: route)
    }
}
extension WidgetContainerViewController: Reloadable {
    func reload() {
        guard let widget = widget as? Reloadable else { return }
        widget.reload()
    }
}
