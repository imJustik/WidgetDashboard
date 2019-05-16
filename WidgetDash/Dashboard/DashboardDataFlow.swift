//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

enum DashboardFlow {
    enum SetupWidgets {
        struct Request  { }

        struct Response {
            var result: [WidgetViewController]
        }

        struct ViewModel {
            var state: Dashboard.State
        }
    }
}
