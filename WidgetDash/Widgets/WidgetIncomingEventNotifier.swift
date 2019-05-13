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
protocol NotifiesSubscribers {
     func notifySubscribers(of event: WidgetEventType)
}

class WidgetIncomingEventNotifier: NotifiesSubscribers {
    let widgetSubscriber: WidgetSubscriptionsHandler

    init(widgetSubscriber: WidgetSubscriptionsHandler) {
        self.widgetSubscriber = widgetSubscriber
    }

    func notifySubscribers(of event: WidgetEventType) {
        widgetSubscriber.fireSubscriptions(for: event)
    }
}
