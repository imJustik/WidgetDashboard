//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import UIKit

protocol Widget {
    var externalDelegate: WidgetActionDelegate? {get set}
    var uid: UUID { get }
}


// Отправляет события из виджета. Widget -> [Внешний мир]
protocol WidgetActionDelegate: AnyObject {}


protocol Reloadable {
    func reload()
}
