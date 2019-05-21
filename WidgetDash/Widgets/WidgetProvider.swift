//  Created by Илья Кузнецов on 13/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

protocol WidgetProviderProtocol {
    func fetchWidgets(completion: (() ->()))
    func refresh(completion: (() -> ()))
}

class WidgetProvider {
    let widgetDataStore: WidgetDataStore
    let widgetService: WidgetService
    let widgetFactory: WidgetFactory

    init(widgetFactory: WidgetFactory, dataStore: WidgetDataStore = WidgetDataStore.shared, service: WidgetService = WidgetService()) {
        self.widgetFactory = widgetFactory
        self.widgetDataStore = dataStore
        self.widgetService = service
    }

    func refresh(completion: @escaping (() -> ())) {
        getWidgets(usingCache: false) { _ in
            completion()
        }
    }

    func getWidgets(usingCache: Bool, completion: @escaping (([WidgetViewController]) -> Void)) {
        if usingCache {
            let widgets = widgetFactory.getWidgets(widgetModels: widgetDataStore.widgets)
            completion(widgets)
            return
        }

        widgetService.fetchWidgets { [weak self] (widgetsStr) in
            let widgets = self?.widgetFactory.getWidgets(widgetModels: widgetsStr)
            self?.widgetDataStore.widgets = widgetsStr
            completion(widgets!)
        }
    }
}
