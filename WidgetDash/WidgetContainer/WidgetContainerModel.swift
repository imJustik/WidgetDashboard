//  Created by Илья Кузнецов on 28/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.


import Foundation

struct WidgetContainerModel {
    let uid: String
    let title: String
    let deeplink: String?
    let widgets: [WidgetType.ModelType]?
}
