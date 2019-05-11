//
//  ContentState.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 10/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import UIKit

enum ContentState {
    case waiting
    case empty
    case error
}

protocol ContentStateView {
    func showState(_ state: ContentState)
}
