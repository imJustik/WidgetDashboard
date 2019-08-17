//
//  Widget1Interactor.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

class Widget2Interactor {
    let presenter: Widget2Presenter

    init(presenter: Widget2Presenter) {
        self.presenter = presenter
    }

    func fetchData(request: Widget2Flow.FetchData.Request) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            let random = String(Int.random(in: 1..<1000))
            let response = Widget2Flow.FetchData.Response(result: random)
            self?.presenter.presentData(response: response)
        }
    }
    
}
