//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

class Widget4Builder {
    func build(
        widgetActionDelegate: Widget4ActionDelegate,
        widgetSubscriptionsHandler: HandlesWidgetSubscriptions?) -> Widget4ViewController {
        let presenter = Widget4Presenter()
        let dataStore = Widget4DataStore()
        let interactor = Widget4Interactor(presenter: presenter, dataStore: dataStore)
        let controller = Widget4ViewController(
            interactor: interactor,
            state: .loading,
            externalDelegate: widgetActionDelegate,
            widgetSubscriber: widgetSubscriptionsHandler)
        presenter.viewController = controller
        return controller
    }
}
