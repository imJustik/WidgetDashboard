//  Created by Илья Кузнецов on 28/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

class Widget3Model: Equatable {
    static func == (lhs: Widget3Model, rhs: Widget3Model) -> Bool {
        return lhs.uid == rhs.uid &&
            lhs.button1Text == rhs.button1Text &&
            lhs.button2Text == rhs.button2Text
    }

    let uid: String
    let button1Text: String
    let button2Text: String

    init(uid: String, button1Text: String, button2Text: String) {
        self.uid = uid
        self.button1Text = button1Text
        self.button2Text = button2Text
    }
}
