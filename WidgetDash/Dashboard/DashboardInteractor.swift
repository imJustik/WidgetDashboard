//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import UIKit

class DashboardInteractor {
    let widgetProvider: WidgetProvider
    let presenter: DashboardPresenter

    init(widgetProvider: WidgetProvider, presenter: DashboardPresenter) {
        self.widgetProvider = widgetProvider
        self.presenter = presenter
    }

    func setupWidgets(request: DashboardFlow.SetupWidgets.Request) {
        widgetProvider.getWidgets(usingCache: false, completion: { [weak self] widgets in
            let response = DashboardFlow.SetupWidgets.Response(result: widgets)
            self?.presenter.presentWidgets(response: response)
        })
    }
}

protocol Some: Widget {}
