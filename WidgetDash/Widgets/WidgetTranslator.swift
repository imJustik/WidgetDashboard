//  Created by Илья Кузнецов on 01/06/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

class WidgetTranslator: Translator {

    enum DTOKeys: String {
        case type
        case content
    }

    // Версий, отличных от 1, у widget1 не существует. Можно использовать его транслятор напрямую
    let widget1Translator = Widget1Translator()

    // Widget2 имеет две версии, поэтому требуется отдельная сущность, которая решит,
    // транслятор какой из версий использовать
    let widget2Translator = Widget2VersionTranslator()

    let widget3Translator = Widget3Translator()
    lazy var widgetContainerTranslator = WidgetContainerTranslator(widgetTranslator: self)

    func translateForm(array: [[String: Any]]) -> [WidgetType.ModelType] {
        return array.map{translate(from: $0)}
    }

    func translate(from json: [String: Any]) -> WidgetType.ModelType {
        let type = WidgetType(rawValue: json[DTOKeys.type.rawValue] as! String)!
        let meta = json[DTOKeys.content.rawValue] as! [String: Any]

        switch type {
        case .widget1:
            let widgetModel = widget1Translator.translate(from: meta)
            print(translateToJson(model: .widget1(widgetModel)))
            return .widget1(widgetModel)
        case .widget2:
            let widgetModel = widget2Translator.translate(from: meta)
            return .widget2(widgetModel)
        case .widget3:
            let widgetModel = widget3Translator.translate(from: meta)
            return .widget3(widgetModel)
        case .container:
            let widget = widgetContainerTranslator.translate(from: meta)
            return .container(widget)
        }
    }

    func translateToJson(model: WidgetType.ModelType) -> [String : Any] {
        switch model {
        case let .widget1(model):
            return widget1Translator.translateToJson(model: model)
        case let .widget2(model):
            return widget2Translator.translateToJson(model: model)
        case let .widget3(model):
            return widget3Translator.translateToJson(model: model)
        case let .container(model):
            return widgetContainerTranslator.translateToJson(model: model)
        }
    }
}

protocol Translator {
    associatedtype Model
    func translate(from json: [String: Any]) -> Model
    func translateToJson(model: Model) -> [String: Any]
}
