//
//  WidgetContaierTranslator.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 28/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

class WidgetContainerTranslator:Translator {
    enum DTOKeys: String {
        case data
        case widgets
        case title
        case deeplink
        case uid
    }

    weak var widgetTranslator: WidgetTranslator?

    init(widgetTranslator: WidgetTranslator) {
        self.widgetTranslator = widgetTranslator
    }

    func translate(from json: [String: Any]) -> WidgetContainerModel {
        let data = json[DTOKeys.data.rawValue] as! [String: Any]
        let widgetsJson = json[DTOKeys.widgets.rawValue] as! [[String: Any]]
        let title = data[DTOKeys.title.rawValue] as! String
        let deeplink = data[DTOKeys.deeplink.rawValue] as? String
        let uid = data[DTOKeys.uid.rawValue] as! String
        let widgets = widgetTranslator?.translateForm(array: widgetsJson)

        return WidgetContainerModel(uid: uid, title: title, deeplink: deeplink, widgets: widgets)
    }

    func translateToJson(model: WidgetContainerModel) -> [String : Any] {
        return [:]
    }
}


