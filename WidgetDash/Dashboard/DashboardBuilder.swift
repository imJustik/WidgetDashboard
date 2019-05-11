//
//  DashboardBuilder.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

class DashboardBuilder {
    func build() -> Dashboard {
        let widgetFactory = WidgetFactory(widgetStrings: ["w1","w2","w3"])
        let presenter = DashboardPresenter()
        let interactor = DashboardInteractor(widgetFactory: widgetFactory, presenter: presenter)
        let viewController = Dashboard(interactor: interactor, state: .initial)
        widgetFactory.externalHandler = viewController
        presenter.viewController = viewController

        return viewController
    }
}
