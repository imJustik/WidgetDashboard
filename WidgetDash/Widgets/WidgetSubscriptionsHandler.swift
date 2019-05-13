//  Created by Илья Кузнецов on 12/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

/// Бизнес-кейсы обновления
/// Например:
/// - Обновить счета
/// - Обновить карты
/// - Обновить бонусы

enum WidgetEventType: CaseIterable {
    case reloadFaces //Обновляет только коллекцию
    case reloadBoth // Обновляет первый и второй виджет
}

/// Управляет подписками виджетов
protocol HandlesWidgetSubscriptions {
    func subscribe(eventType: WidgetEventType, uid: UUID, handler: @escaping () -> Void)
    func fireSubscriptions(for event: WidgetEventType)
}


class WidgetSubscriptionsHandler: HandlesWidgetSubscriptions {
    var reloadFacesSubscriptions: [UUID: (() -> Void)] = [:]
    var reloadBothSubscriptions: [UUID: (() -> Void)] = [:]

    func subscribe(eventType: WidgetEventType, uid: UUID, handler: @escaping () -> Void) {
        switch eventType {
        case .reloadFaces:
            reloadFacesSubscriptions[uid] = handler
        case .reloadBoth:
            reloadBothSubscriptions[uid] = handler
        }
    }

    func unsubscribe(eventType: WidgetEventType, uid: UUID) {
        switch eventType {
        case .reloadFaces:
            reloadFacesSubscriptions[uid] = nil
        case .reloadBoth:
            reloadBothSubscriptions[uid] = nil
        }
    }

    func unsubscribe(uid: UUID) {
        WidgetEventType.allCases.forEach {
            unsubscribe(eventType: $0, uid: uid)
        }
    }

    func unsubscribeAll() {
        reloadBothSubscriptions = [:]
        reloadBothSubscriptions = [:]
    }

    func fireSubscriptions(for event: WidgetEventType) {
        switch event {
        case .reloadFaces:
            reloadFacesSubscriptions.values.forEach { $0() }
        case .reloadBoth:
            reloadBothSubscriptions.values.forEach { $0() }
        }
    }
}
