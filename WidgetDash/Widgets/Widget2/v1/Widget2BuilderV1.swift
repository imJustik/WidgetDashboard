//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation


class Widget2BuilderV1 {
    var widgetModel: Widget2Model.v1?

    func set(model: Widget2Model.v1) -> Widget2BuilderV1 {
        widgetModel = model
        return self
    }

    func build(
        externalDelegate: Widget2ActionDelegate,
        widgetSubscriptionsHandler: HandlesWidgetSubscriptions?) -> Widget2ViewController {

        guard let model = widgetModel else {
            fatalError("set model first")
        }

        let presenter = Widget2Presenter()
        let interactor = Widget2Interactor(presenter: presenter)
        let controller = Widget2ViewController(
            interactor: interactor,
            state: .loading,
            externalDelegate: externalDelegate,
            widgetSubscriber: widgetSubscriptionsHandler,
            model: model)

        presenter.viewController = controller
        return controller
    }
}

