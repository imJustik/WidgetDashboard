//  Created by Илья Кузнецов on 13/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.


class WidgetService {
    func fetchWidgets(completion: @escaping ([String]) -> Void) {
          completion(["w1","w2","w3"])
    }
}
