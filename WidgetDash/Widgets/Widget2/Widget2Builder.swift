//
//  Widget1Builder.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

class Widget2Builder {
    func build(
        externalDelegate: Widget2ActionDelegate,
        widgetSubscriptionsHandler: HandlesWidgetSubscriptions?) -> Widget2ViewController {
        let presenter = Widget2Presenter()
        let interactor = Widget2Interactor(presenter: presenter)
        let controller = Widget2ViewController(
            interactor: interactor,
            state: .loading,
            externalDelegate: externalDelegate,
            widgetSubscriber: widgetSubscriptionsHandler)
        presenter.viewController = controller
        return controller
    }
}
