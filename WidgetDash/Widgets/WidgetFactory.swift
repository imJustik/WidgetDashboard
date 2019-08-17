//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.


import UIKit

class WidgetFactory {
    var widgets = [WidgetType]()

    /// Испольльзуют виджеты для подписки на события
    var widgetSubscriptionsHandler: HandlesWidgetSubscriptions?
    /// Обрабатывает события, пришедшие из виджета
    var widgetOutcommingHandler: WidgetActionDelegate? // dashboard

    // [.widget2(.v1(model), .widget1(model), .widget3(model)]

    func getWidgets(widgetModels: [WidgetType.ModelType]) -> [WidgetViewController] {
        return widgetModels.compactMap {
            switch $0 {
            case .widget1:
                guard
                    let widget1Delegate = widgetOutcommingHandler as? Widget1ActionDelegate
                else {  fatalError("Dashboard does not conform this protocol") }

                let builder = Widget1Builder()
                let widget =  builder.build(
                    widgetActionDelegate: widget1Delegate,
                    widgetSubscriptionsHandler: widgetSubscriptionsHandler)

                return widget

            case let .widget2(model):
                guard
                    let widget2Delegate = widgetOutcommingHandler as? Widget2ActionDelegate
                else { fatalError("Dashboard does not conform this protocol") }

                let builder = Widget2Builder().set(model: model)
                return builder.build(
                    externalDelegate: widget2Delegate,
                    widgetSubscriptionsHandler: widgetSubscriptionsHandler)

            case let .widget3(model):
                guard
                    let widget3Delegate = widgetOutcommingHandler as? Widget3ActionDelegate
                else { fatalError("Dashboard does not conform this protocol") }

                let builder = Widget3Builder().set(model: model)
                let widget = builder.build(
                    externalDelegate: widget3Delegate)
                return widget

            case .widget4:
                guard
                    let widget4Delegate = widgetOutcommingHandler as? Widget4ActionDelegate
                    else { fatalError("Dashboard does not conform this protocol") }

                let builder = Widget4Builder()
                let widget = builder.build(
                    widgetActionDelegate: widget4Delegate,
                    widgetSubscriptionsHandler: widgetSubscriptionsHandler)
                return widget

            case let .container(model):
                let widgets = self.getWidgets(widgetModels: model.widgets!)
                let container = WidgetContainerViewController(
                    widgets: widgets,
                    externalDelegate: widgetOutcommingHandler,
                    model: model)
                return container
            }
        }
    }
}



