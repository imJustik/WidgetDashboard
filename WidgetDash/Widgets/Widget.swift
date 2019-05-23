//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import UIKit

protocol Widget {
    var externalDelegate: WidgetActionDelegate? {get set}
    var uid: UUID { get }
}

// Отправляет события из виджета. Widget -> [Внешний мир]
protocol WidgetActionDelegate: AnyObject {}

protocol Reloadable {
    func reload()
}


/// Cписок всех возможных виджетов
enum WidgetType: String {
    case widget1 = "widget1"
    case widget2 = "widget2"
    case widget3 = "widget3"
}

// TODO: Подумать, как можно сделать свой WidgetModel для каждого типа виджета

/// DTO модель виджет-контейнера
struct WidgetContainerModel {
    let type: WidgetContainerType
    let title: String
    let deeplink: String?
}

enum WidgetContainerType: String {
    case basic = "Basic"
}


class Widget1Model {
    let container: WidgetContainerModel?
    init(container: WidgetContainerModel? = nil) {
        self.container = container
    }
}

class Widget1Translator {
    func traslate(from json: [String: Any]) -> Widget1Model {
        return Widget1Model(container: WidgetContainerModel(type: .basic, title: "Переводы", deeplink: "deeplink1"))
    }
}


class Widget2Model {
    var title: String
    let container: WidgetContainerModel?

    init(title: String, container: WidgetContainerModel? = nil) {
        self.title = title
        self.container = container
    }
}

class Widget2Translator {
    func traslate(from json: [String: Any]) -> Widget2Model {
        let title = json["title"] as! String
        return Widget2Model(title: title)

    // TODO: Добавить обработку контейнера
    }
}


class Widget3Model {
    let button1Text: String
    let button2Text: String
    let container: WidgetContainerModel?

    init(button1Text: String, button2Text: String, container: WidgetContainerModel? = nil) {
        self.button1Text = button1Text
        self.button2Text = button2Text
        self.container = container
    }
}


class Widget3Translator {
    func traslate(from json: [String: Any]) -> Widget3Model {
        let button1Text = json["button1Text"] as! String
        let button2Text = json["button2Text"] as! String

        return Widget3Model(button1Text: button1Text, button2Text: button2Text)
    }
}

enum WidgetModelType {
    case widget1(Widget1Model)
    case widget2(Widget2Model)
    case widget3(Widget3Model)

    var model: Any {
        switch self {
        case let .widget1(model):
            return model
        case let .widget2(model):
            return model
        case let .widget3(model):
            return model
        }
    }
}


class WidgetTranslator {
    let widget1Translator = Widget1Translator()
    let widget2Translator = Widget2Translator()
    let widget3Translator = Widget3Translator()

    func translateForm(array: [[String: Any]]) -> [WidgetModelType] {
        var arr = [WidgetModelType] ()
        array.forEach {
            let widgetEnum = translateFrom(json: $0)
            arr.append(widgetEnum)
        }
        return arr
    }


    func translateFrom(json: [String: Any]) -> WidgetModelType {
        let type = WidgetType(rawValue: json["id"] as! String)!
        let widgetData = json["widgetData"] as! [String: Any]

        switch type {
        case .widget1:
            let widgetModel = widget1Translator.traslate(from: widgetData)
            return .widget1(widgetModel)
        case .widget2:
            let widgetModel = widget2Translator.traslate(from: widgetData)
            return .widget2(widgetModel)
        case .widget3:
            let widgetModel = widget3Translator.traslate(from: widgetData)
            return .widget3(widgetModel)
        }
    }
}


