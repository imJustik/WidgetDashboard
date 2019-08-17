import UIKit

protocol WidgetContainerDelegate: AnyObject {
    func navigate(to route: String)
    func layout()
}


class WidgetContainerViewController: WidgetViewController {
    var externalDelegate: WidgetActionDelegate?
    let uid: String

    var containerView: WidgetContainerView
    let widgets: [WidgetViewController]

    var route: String?

    init(widgets: [WidgetViewController],
         externalDelegate: WidgetActionDelegate? = nil,
         model: WidgetContainerModel) {
        self.widgets = widgets
        self.externalDelegate = externalDelegate
        self.route = model.deeplink
        self.uid = model.uid
        containerView = WidgetContainerView(title: model.title, needAction: route != nil)
        super.init(nibName: nil, bundle: nil)
        containerView.delegate = self
    }

    required init?(coder _: NSCoder) {
        fatalError()
    }

    override func loadView() {
        view = containerView
        widgets.forEach {
            addChild($0)
            $0.didMove(toParent: self)
            containerView.add(view: $0.view)
        }

    }
}

extension WidgetContainerViewController: ContainerViewDelegate {
    func tapButton() {
        guard let route = route else { return }
        (externalDelegate as? WidgetContainerDelegate)?.navigate(to: route)
    }

    func layout() {

    }
}
extension WidgetContainerViewController: Reloadable {
    func reload() {
        widgets.forEach {
            guard let widget = $0 as? Reloadable else { return }
            widget.reload()
        }
    }
}
