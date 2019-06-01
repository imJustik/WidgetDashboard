//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

class Widget2BuilderV2 {
    var widgetModel: Widget2Model.v2?

    func set(model: Widget2Model.v2) -> Widget2BuilderV2 {
        widgetModel = model
        return self
    }


    func build(
        externalDelegate: Widget2ActionDelegate,
        widgetSubscriptionsHandler: HandlesWidgetSubscriptions?) -> Widget2ViewControllerV2 {

        guard let model = widgetModel else {
            fatalError("WidgetModel is nil")
        }

        let presenter = Widget2PresenterV2()
        let interactor = Widget2InteractorV2(presenter: presenter)
        let controller = Widget2ViewControllerV2(
            interactor: interactor,
            state: .loading,
            externalDelegate: externalDelegate,
            widgetSubscriber: widgetSubscriptionsHandler,
            model: model)
        presenter.viewController = controller
        return controller
    }
}
