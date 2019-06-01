//  Created by Илья Кузнецов on 28/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

struct Widget2Model {
    struct v1 {
        let uid: String
        var title: String
    }

    struct v2 {
        let uid: String
        var title: String
        var backgroundColor: String
        var textColor: String
    }
}

enum Widget2Versions {
    enum Versions: Int {
        case v1 = 1
        case v2 = 2
    }

    case v1(Widget2Model.v1)
    case v2(Widget2Model.v2)

    var model: Any {
        switch self {
        case let .v1(model):
            return model
        case let .v2(model):
            return model
        }
    }
}
