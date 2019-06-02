//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

class Widget3Interactor {
    let presenter: Widget3Presenter

    init(presenter: Widget3Presenter) {
        self.presenter = presenter
    }

    func fetchData(request: Widget3Flow.FetchData.Request) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            let response = Widget3Flow.FetchData.Response(result: "Widget3")
            self?.presenter.presentData(response: response)
        }
    }
    
}
