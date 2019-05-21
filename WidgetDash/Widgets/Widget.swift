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


/// Cписок всех возможных виджетов
enum WidgetType: String {
    case widget1 = "w1"
    case widget2 = "w2"
    case widget3 = "w3"
}


/// DTO модель виджета. В нее парсится то, что пришло от WidgetToggle.
/// Все поля, кроме type, кажется, должны быть опциональными
class WidgetModel {
    let type: WidgetType
    var container: WidgetContainerModel?

    init(type: WidgetType, container: WidgetContainerModel? = nil) {
        self.type = type
        self.container = container
    }
}

// TODO: Подумать, как можно сделать свой WidgetModel для каждого типа виджета

/// DTO модель виджет-контейнера
struct WidgetContainerModel {
    let type: WidgetContainerType
    let title: String
    let deeplink: String?
}

enum WidgetContainerType: String {
    case basic = "Basic"
}




