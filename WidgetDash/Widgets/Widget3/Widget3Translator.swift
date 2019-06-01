//  Created by Илья Кузнецов on 28/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

class Widget3Translator: Translator {

    enum DTOKeys: String {
        case data
        case version
        case uid
        case button1Text
        case button2Text
    }

    func translate(from json: [String: Any]) -> Widget3Model {
        let widgetData = json[DTOKeys.data.rawValue] as! [String: Any]
        let uid = widgetData[DTOKeys.uid.rawValue] as! String
        let button1Text = widgetData[DTOKeys.button1Text.rawValue] as! String
        let button2Text = widgetData[DTOKeys.button2Text.rawValue] as! String
        let widget3 = Widget3Model(uid: uid, button1Text: button1Text, button2Text: button2Text)
        return widget3
    }

    func translateToJson(model: Widget3Model) -> [String : Any] {
        let data = [
            [DTOKeys.data.rawValue:
                [DTOKeys.uid.rawValue: model.uid,
                 DTOKeys.button1Text.rawValue: model.button1Text,
                 DTOKeys.button1Text.rawValue: model.button2Text
                ]
            ]
        ]

        return [
            DTOKeys.version.rawValue: 1,
            DTOKeys.data.rawValue: data
        ]
    }
}
