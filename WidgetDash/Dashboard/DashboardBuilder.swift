//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

class DashboardBuilder {
    func build() -> Dashboard {
        let widgetSubscriptionsHandler = WidgetSubscriptionsHandler()
        let widgetIncomingHandler = WidgetIncomingEventNotifier(widgetSubscriptionsHandler: widgetSubscriptionsHandler)

        let widgetFactory = WidgetFactory()
        let widgetProvider = WidgetProvider(widgetFactory: widgetFactory)

        let presenter = DashboardPresenter()
        let interactor = DashboardInteractor(widgetProvider: widgetProvider, presenter: presenter)
        let viewController = Dashboard(
            interactor: interactor,
            state: .initial,
            widgetActionHandler: widgetIncomingHandler)

        widgetFactory.widgetSubscriptionsHandler = widgetSubscriptionsHandler
        widgetFactory.widgetOutcommingHandler = viewController

        presenter.viewController = viewController

        return viewController
    }
}
