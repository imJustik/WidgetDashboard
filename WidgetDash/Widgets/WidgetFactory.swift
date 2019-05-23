//
//  WidgetFactory.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

//TODO: сделать WidgetService

import UIKit


class WidgetFactory {
    var widgets = [WidgetType]()

    /// Испольльзуют виджеты для подписки на события
    var widgetSubscriptionsHandler: HandlesWidgetSubscriptions?
    /// Обрабатывает события, пришедшие из виджета
    var widgetOutcommingHandler: WidgetActionDelegate?
    
    func getWidgets(widgetModels: [WidgetModel]) -> [WidgetViewController] {
        return widgetModels.compactMap {
            switch $0.type {
            case .widget1:
                guard
                    let widget1Delegate = widgetOutcommingHandler as? Widget1ActionDelegate
                else {  fatalError("Dashboard does not conform this protocol") }

                let builder = Widget1Builder()
                let widget =  builder.build(
                    widgetActionDelegate: widget1Delegate,
                    widgetSubscriptionsHandler: widgetSubscriptionsHandler)

                if let container = $0.container {
                    let container = WidgetContainerViewController(
                        widget: widget,
                        externalDelegate: widget1Delegate,
                        title: container.title,
                        route: container.deeplink
                    )
                    return container
                }

                return widget

            case .widget2:
                guard
                    let widget2Delegate = widgetOutcommingHandler as? Widget2ActionDelegate
                else { fatalError("Dashboard does not conform this protocol") }

                let builder = Widget2Builder()
                let widget = builder.build(
                    externalDelegate: widget2Delegate,
                    widgetSubscriptionsHandler: widgetSubscriptionsHandler)


                if let container = $0.container {
                    let container = WidgetContainerViewController(
                        widget: widget,
                        externalDelegate: widget2Delegate,
                        title: container.title,
                        route: container.deeplink
                    )

                    return container
                }
                return widget

            case .widget3:
                guard
                    let widget3Delegate = widgetOutcommingHandler as? Widget3ActionDelegate
                else { fatalError("Dashboard does not conform this protocol") }

                let builder = Widget3Builder()

                let widget = builder.build(
                    externalDelegate: widget3Delegate)


                if let container = $0.container {
                    let container = WidgetContainerViewController(
                        widget: widget,
                        externalDelegate: widget3Delegate,
                        title: container.title,
                        route: container.deeplink
                    )
                    return container
                }

                return widget
            }
        }
    }
}



