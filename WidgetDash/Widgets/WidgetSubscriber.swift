//  Created by Илья Кузнецов on 12/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

/// Бизнес-кейсы обновления
/// Например:
/// - Обновить счета
/// - Обновить карты
/// - Обновить бонусы

enum WidgetEventType {
    case reloadFaces //Обновляет только коллекцию
    case reloadBoth // Обновляет первый и второй виджет
}

/// Управляет подписками виджетов
protocol WidgetSubscriberProtocol {
    func subscribe(eventType: WidgetEventType, handler: @escaping () -> Void)
}


class WidgetSubscriber: WidgetSubscriberProtocol {

    var reloadFacesSubscriptions: [(() -> Void)] = []
    var reloadBothSubscriptions: [(() -> Void)] = []

    func subscribe(eventType: WidgetEventType, handler: @escaping () -> Void) {
        switch eventType {
        case .reloadFaces:
            reloadFacesSubscriptions.append(handler)
        case .reloadBoth:
            reloadBothSubscriptions.append(handler)
        }
    }
}
