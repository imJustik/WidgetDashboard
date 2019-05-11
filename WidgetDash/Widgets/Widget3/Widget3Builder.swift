//
//  Widget1Builder.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

class Widget3Builder {
    func build(externalDelegate: Widget3ExternalDelegate) -> Widget3ViewController {
        let presenter = Widget3Presenter()
        let interactor = Widget3Interactor(presenter: presenter)
        let controller = Widget3ViewController(
            interactor: interactor,
            state: .loading,
            externalDelegate: externalDelegate)
        presenter.viewController = controller
        return controller
    }
}
