//  Created by Илья Кузнецов on 28/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.


import Foundation
class Widget2Translator {

    enum DTOKeys: String {
        case title
        case uid
        case data
        case version
        case backgroundColor
        case textColor
    }
    
    struct v1: Translator {
        func translate(from json: [String: Any]) -> Widget2Model.v1 {
            let title = json[DTOKeys.title.rawValue] as! String
            let uid = json[DTOKeys.uid.rawValue] as! String
            let widget2 = Widget2Model.v1(uid: uid, title: title)
            return widget2
        }

        func translateToJson(model: Widget2Model.v1) -> [String : Any] {
            let data = [[DTOKeys.data.rawValue:[DTOKeys.title.rawValue: model.title]]]
            return [DTOKeys.version.rawValue: 1, DTOKeys.data.rawValue: data]
        }
    }

    struct v2: Translator {
        func translate(from json: [String: Any]) -> Widget2Model.v2 {
            let title = json[DTOKeys.title.rawValue] as! String
            let backgroundColor = json[DTOKeys.backgroundColor.rawValue] as! String
            let textColor = json[DTOKeys.textColor.rawValue] as! String
            let uid = json[DTOKeys.uid.rawValue] as! String
            let widget2 = Widget2Model.v2(uid: uid, title: title, backgroundColor: backgroundColor, textColor: textColor)
            return widget2
        }

        func translateToJson(model: Widget2Model.v2) -> [String : Any] {
            let data = [
                [DTOKeys.data.rawValue:[
                    DTOKeys.title.rawValue: model.title,
                    DTOKeys.backgroundColor.rawValue: model.backgroundColor,
                    DTOKeys.textColor.rawValue: model.textColor
                    ]
                ]
            ]
            return [DTOKeys.version.rawValue: 1, DTOKeys.data.rawValue: data]
        }
    }
}

