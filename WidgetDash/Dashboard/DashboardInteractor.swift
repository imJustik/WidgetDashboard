//
//  DashboardInteractor.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import UIKit

class DashboardInteractor {
    let widgetFactory: WidgetFactory
    let presenter: DashboardPresenter

    init(widgetFactory: WidgetFactory, presenter: DashboardPresenter) {
        self.widgetFactory = widgetFactory
        self.presenter = presenter
    }

    func setupWidgets(request: DashboardFlow.SetupWidgets.Request) {
        let widgets = widgetFactory.getWidgets()
        let response = DashboardFlow.SetupWidgets.Response(result: widgets)
        presenter.presentWidgets(response: response)
        
    }
}

protocol Some: Widget {}
