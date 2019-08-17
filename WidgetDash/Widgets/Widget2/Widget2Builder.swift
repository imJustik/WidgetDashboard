//  Created by Илья Кузнецов on 01/06/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation
// .v1(model)
class Widget2Builder {
    var widgetModel: Widget2Versions?

    let builderVersion1 = Widget2BuilderV1()
    let builderVersion2 = Widget2BuilderV2()

    func set(model: Widget2Versions) -> Widget2Builder {
        widgetModel = model
        return self
    }

    func build(
        externalDelegate: Widget2ActionDelegate,
        widgetSubscriptionsHandler: HandlesWidgetSubscriptions?) -> WidgetViewController {
        
        guard let model = widgetModel else {
            fatalError("set model first")
        }

        switch model {
        case let .v1(model):
            return builderVersion1.set(model: model).build(
                externalDelegate: externalDelegate,
                widgetSubscriptionsHandler: widgetSubscriptionsHandler)
        case let .v2(model):
            return builderVersion2.set(model: model).build(
                externalDelegate: externalDelegate,
                widgetSubscriptionsHandler: widgetSubscriptionsHandler)
        }
    }
}
