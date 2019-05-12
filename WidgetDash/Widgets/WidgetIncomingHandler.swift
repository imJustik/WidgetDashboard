//
//  WidgetIncomingHandler.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 12/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

/// Посылает события виджетам подписчикам.
/// Коммуникация внешнего мира с виджетами.
protocol WidgetIncomingHandlerProtocol {
     func updateSubscribers(for action: WidgetEventType)
}

class WidgetIncomingHandler: WidgetIncomingHandlerProtocol {
    let widgetSubscriber: WidgetSubscriber

    init(widgetSubscriber: WidgetSubscriber) {
        self.widgetSubscriber = widgetSubscriber
    }

    func updateSubscribers(for action: WidgetEventType) {
        switch action {
        case .reloadBoth:
            widgetSubscriber.reloadBothSubscriptions.forEach { $0() }
        case .reloadFaces:
            widgetSubscriber.reloadFacesSubscriptions.forEach { $0() }

        }
    }
}
