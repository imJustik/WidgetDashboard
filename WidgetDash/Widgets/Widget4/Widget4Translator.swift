//  Created by Илья Кузнецов on 28/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.


import Foundation

class Widget4Translator: Translator {
    enum DTOKeys: String {
        case uid
        case version
        case data
    }

    func translate(from json: [String: Any]) -> Widget4Model {
        let data = json[DTOKeys.data.rawValue] as! [String: Any]
        let uid = data[DTOKeys.uid.rawValue] as! String
        return Widget4Model(uid: uid)
    }

    func translateToJson(model: Widget4Model) -> [String : Any] {
        return [
            DTOKeys.version.rawValue: 1,
                DTOKeys.data.rawValue: [
                    DTOKeys.uid.rawValue: model.uid
            ]
        ]
    }
}
