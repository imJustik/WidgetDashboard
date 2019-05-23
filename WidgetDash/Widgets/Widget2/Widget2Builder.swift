//
//  Widget1Builder.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

class Widget2Builder: WidgetModuleBuilder {
    override func build() -> WidgetViewController {
        let presenter = Widget2Presenter()
        let interactor = Widget2Interactor(presenter: presenter)
        let controller = Widget2ViewController(
            interactor: interactor,
            state: .loading,
            externalDelegate: actionDelegate,
            widgetSubscriber: subscriptionsHandler)
        presenter.viewController = controller
        return controller
    }
}
