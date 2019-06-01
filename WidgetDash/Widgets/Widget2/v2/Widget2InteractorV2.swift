//
//  Widget1Interactor.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

class Widget2InteractorV2 {
    let presenter: Widget2PresenterV2

    init(presenter: Widget2PresenterV2) {
        self.presenter = presenter
    }

    func fetchData(request: Widget2Flow.FetchData.Request) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            let random = String(Int.random(in: 1..<1000))
            let response = Widget2FlowV2.FetchData.Response(result: random)
            self?.presenter.presentData(response: response)
        }
    }
    
}
