//
//  WidgetFactory.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

//TODO: сделать WidgetService

import UIKit

class WidgetModuleBuilder {
    var actionDelegate: WidgetActionDelegate?
    var subscriptionsHandler: HandlesWidgetSubscriptions?
    func setActionDelegate(_ actionDelegate: WidgetActionDelegate?) -> Self {
        self.actionDelegate = actionDelegate
        return self
    }
    
    func setSubscriptionsHandler(_ subscriptionsHandler: HandlesWidgetSubscriptions?) -> Self {
        self.subscriptionsHandler = subscriptionsHandler
        return self
    }
    
    func build() -> WidgetViewController {
        fatalError("build must override")
    }
    
    required init() { }
}

class WidgetContainerBuilder<ModuleBuilder: WidgetModuleBuilder>: WidgetModuleBuilder {
    var widgetModel: WidgetModel?
    
    func setWidget(_ widgetModel: WidgetModel) -> Self {
        self.widgetModel = widgetModel
        return self
    }
    
    override func build() -> WidgetViewController {
        guard
            let model = widgetModel
        else { fatalError("error") }
        let simpleWidget = ModuleBuilder()
            .setActionDelegate(self.actionDelegate)
            .setSubscriptionsHandler(self.subscriptionsHandler)
            .build()
        if let container = model.container {
            let container = WidgetContainerViewController(
                widget: simpleWidget,
                externalDelegate: self.actionDelegate,
                title: container.title,
                route: container.deeplink
            )
            
            return container
        }
        return simpleWidget
    }
}

class WidgetFactory {
    var widgets = [WidgetType]()

    /// Испольльзуют виджеты для подписки на события
    var widgetSubscriptionsHandler: HandlesWidgetSubscriptions?
    /// Обрабатывает события, пришедшие из виджета
    var widgetOutcommingHandler: WidgetActionDelegate?
    
    var firstWidgetBuilder: WidgetModuleBuilder = Widget1Builder()
    var secondWidgetBuilder: WidgetModuleBuilder = Widget2Builder()
    var thirsWidgetBuilder: WidgetModuleBuilder = Widget3Builder()

    func getWidgets(widgetModels: [WidgetModel]) -> [WidgetViewController] {
        return widgetModels.compactMap {
            switch $0.type {
            case .widget1:
                guard
                    let widget1Delegate = widgetOutcommingHandler as? Widget1ActionDelegate
                else { fatalError("Dashboard does not conform this protocol") }
                return WidgetContainerBuilder<Widget1Builder>()
                    .setWidget($0)
                    .setActionDelegate(widget1Delegate)
                    .setSubscriptionsHandler(widgetSubscriptionsHandler)
                    .build()
            case .widget2:
                guard
                    let widget2Delegate = widgetOutcommingHandler as? Widget2ActionDelegate
                else { fatalError("Dashboard does not conform this protocol") }
                return WidgetContainerBuilder<Widget2Builder>()
                    .setWidget($0)
                    .setActionDelegate(widget2Delegate)
                    .setSubscriptionsHandler(widgetSubscriptionsHandler)
                    .build()

            case .widget3:
                guard
                    let widget3Delegate = widgetOutcommingHandler as? Widget3ActionDelegate
                else { fatalError("Dashboard does not conform this protocol") }
                return WidgetContainerBuilder<Widget2Builder>()
                    .setWidget($0)
                    .setActionDelegate(widget3Delegate)
                    .build()
            }
        }
    }
}



