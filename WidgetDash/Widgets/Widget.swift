//
//  Widget.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import UIKit

protocol Widget {
    var externalDelegate: WidgetExternalDelegate? {get set}
}

protocol WidgetExternalDelegate: AnyObject { }
