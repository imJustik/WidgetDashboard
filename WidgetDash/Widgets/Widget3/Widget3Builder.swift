//
//  Widget1Builder.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

class Widget3Builder: WidgetModuleBuilder {
    override func build() -> WidgetViewController {
        let presenter = Widget3Presenter()
        let interactor = Widget3Interactor(presenter: presenter)
        let controller = Widget3ViewController(
            interactor: interactor,
            state: .loading,
            externalDelegate: actionDelegate)
        presenter.viewController = controller
        return controller
    }
}
