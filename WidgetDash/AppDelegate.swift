//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let provider = WidgetsTypeProvider()
        // TODO: сделать состояние загрузки для дашборда, если кеш пустой
        provider.fetchWidgets {
            let builder = DashboardBuilder()
            let controller = builder.build()
            let navigationController = UINavigationController(rootViewController: controller)
            controller.title = "Dashboard example"
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
        }
        return true
    }
}

