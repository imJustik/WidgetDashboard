//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

class Widget1Interactor {
    let presenter: Widget1Presenter

    init(presenter: Widget1Presenter) {
        self.presenter = presenter
    }

    func fetchData(request: Widget1Flow.FetchData.Request) {
        let rand = Double.random(in: 1.1...4)
        DispatchQueue.main.asyncAfter(deadline: .now() + rand) { [weak self] in
            let response = Widget1Flow.FetchData.Response(result: "Widget1")
            self?.presenter.presentData(response: response)
        }
    }
    
}
