//
//  Widget1Builder.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

class Widget1Builder {
    func build(
        externalDelegate: Widget1ExternalDelegate,
        widgetSubscriber: HandlesWidgetSubscriptions?) -> Widget1ViewController {
        let presenter = Widget1Presenter()
        let interactor = Widget1Interactor(presenter: presenter)
        let controller = Widget1ViewController(
            interactor: interactor,
            state: .loading,
            externalDelegate: externalDelegate,
            widgetSubscriber: widgetSubscriber)
        presenter.viewController = controller
        return controller
    }
}
