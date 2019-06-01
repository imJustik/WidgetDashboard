//  Created by Илья Кузнецов on 30/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

class Widget2VersionTranslator {
    enum DTOKeys: String {
        case data
        case version
        case type
        case content
    }

    let widget2Version1Translator = Widget2Translator.v1()
    let widget2Version2Translator = Widget2Translator.v2()

    func translate(from json: [String : Any]) -> Widget2Versions {
        let version = Widget2Versions.Versions(rawValue: json[DTOKeys.version.rawValue] as! Int)!
        let data = json[DTOKeys.data.rawValue] as! [String: Any]

        switch version {
        case .v1:
            let widget = widget2Version1Translator.translate(from: data)
            return Widget2Versions.v1(widget)
        case .v2:
            let widget = widget2Version2Translator.translate(from: data)
            return Widget2Versions.v2(widget)
        }
    }

    func translateToJson(model: Widget2Versions) -> [String : Any] {
        var content: [String: Any] = [:]
        switch model {
        case let .v1(model):
            content = widget2Version1Translator.translateToJson(model: model)
        case let .v2(model):
            content = widget2Version2Translator.translateToJson(model: model)
        }
        return [
            DTOKeys.content.rawValue: content
        ]
    }
}
