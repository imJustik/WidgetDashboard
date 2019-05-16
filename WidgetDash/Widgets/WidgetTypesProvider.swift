//  Created by Илья Кузнецов on 13/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

class WidgetsTypeProvider {
    let dataStore: WidgetDataStore
    let service: WidgetService

    init(
        dataStore: WidgetDataStore = WidgetDataStore.shared,
        service: WidgetService = WidgetService()
    ) {
        self.dataStore = dataStore
        self.service = service
    }

    func fetchWidgets(completion: @escaping (() -> Void)) {
        service.fetchWidgets { widgets in
            self.dataStore.widgets = widgets
            completion()
        }
    }
}
