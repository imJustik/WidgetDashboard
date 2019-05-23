//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

class Widget1Builder: WidgetModuleBuilder {
    override func build() -> WidgetViewController {
        let presenter = Widget1Presenter()
        let interactor = Widget1Interactor(presenter: presenter)
        let controller = Widget1ViewController(
            interactor: interactor,
            state: .loading,
            externalDelegate: self.actionDelegate,
            widgetSubscriber: self.subscriptionsHandler)
        presenter.viewController = controller
        return controller
    }
}
