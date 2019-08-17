//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import UIKit

typealias WidgetViewController = Widget & UIViewController

protocol Widget {
    var externalDelegate: WidgetActionDelegate? {get set}
}

// Отправляет события из виджета. Widget -> [Внешний мир]
protocol WidgetActionDelegate: AnyObject {}

protocol Reloadable {
    func reload()
}

/// Cписок всех возможных виджетов
enum WidgetType: String {
    case widget1 = "widget1" // коллекция
    case widget2 = "widget2"
    case widget3 = "widget3"
    case widget4 = "widget4" // таблица
    case container = "container"

    enum ModelType {

        case widget1(Widget1Model)
        case widget2(Widget2Versions)
        case widget3(Widget3Model)
        case widget4(Widget4Model)
        case container(WidgetContainerModel)

        var model: Any {
            switch self {
            case let .widget1(model):
                return model
            case let .widget2(model):
                return model
            case let .widget3(model):
                return model
            case let .widget4(model):
                return model
            case let .container(model):
                return model
            }
        }
    }
}

enum WidgetContainerType: String {
    case basic = "Basic"
}


