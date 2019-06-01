//  Created by Илья Кузнецов on 13/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

class WidgetDataStore {
    static let shared = WidgetDataStore()
    var widgets: [WidgetType.ModelType] = []

    private init() {}
}
