//
//  Widget.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import UIKit

protocol Widget {
    var externalDelegate: WidgetOutcomingHandler? {get set}
    var uid: UUID { get }
}

protocol Reloadable {
    func reload()
}
