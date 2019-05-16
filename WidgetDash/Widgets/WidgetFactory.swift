//
//  WidgetFactory.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

//TODO: сделать WidgetService

import UIKit

enum WidgetType: String {
    case widget1 = "w1"
    case widget2 = "w2"
    case widget3 = "w3"
}

class WidgetFactory {
    let widgetStrings: [String] = []
    var widgets = [WidgetType]()

    /// Испольльзуют виджеты для подписки на события
    var widgetSubscriptionsHandler: HandlesWidgetSubscriptions?
    /// Обрабатывает события, пришедшие из виджета
    var widgetOutcommingHandler: WidgetActionDelegate?

    func getWidgets(widgetStrings: [String]) -> [WidgetViewController] {
        return widgetStrings.compactMap {
            switch WidgetType.init(rawValue: $0)! {
            case .widget1:
                guard
                    let widget1Delegate = widgetOutcommingHandler as? Widget1ActionDelegate
                else {  fatalError("Dashboard does not confirm this protocol") }
                let builder = Widget1Builder()

                let widget =  builder.build(
                    widgetActionDelegate: widget1Delegate,
                    widgetSubscriptionsHandler: widgetSubscriptionsHandler)

                let route = Widget1Details()
                let container = WidgetContainerViewController(
                    widget: widget,
                    externalDelegate: widget1Delegate,
                    title: "Переводы",
                    route: route
                )
                return container

            case .widget2:
                guard
                    let widget2Delegate = widgetOutcommingHandler as? Widget2ActionDelegate
                else { fatalError("Dashboard does not confirm this protocol") }

                let builder = Widget2Builder()
                let widget = builder.build(
                    externalDelegate: widget2Delegate,
                    widgetSubscriptionsHandler: widgetSubscriptionsHandler)

                let route = Widget2Details()
                let container = WidgetContainerViewController(
                    widget: widget,
                    title: "Кредиты",
                    route: route
                )

                return container

            case .widget3:
                guard
                    let widget3Delegate = widgetOutcommingHandler as? Widget3ActionDelegate
                else { fatalError("Dashboard does not confirm this protocol") }

                let builder = Widget3Builder()
                return builder.build(externalDelegate: widget3Delegate)
            }
        }
    }
}



