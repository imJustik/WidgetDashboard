//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.


import Foundation

class Widget3Builder {
    var widgetModel: Widget3Model?

    func set(model: Widget3Model) -> Widget3Builder {
        widgetModel = model
        return self
    }

    func build(externalDelegate: Widget3ActionDelegate) -> Widget3ViewController {
        guard let model = widgetModel else {
            fatalError("WidgetModel is nil")
        }

        let presenter = Widget3Presenter()
        let interactor = Widget3Interactor(presenter: presenter)
        let controller = Widget3ViewController(
            interactor: interactor,
            state: .display,
            externalDelegate: externalDelegate,
            model: model)
        presenter.viewController = controller
        return controller
    }
}
