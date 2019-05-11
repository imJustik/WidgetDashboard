//
//  Widget1Interactor.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

class Widget1Interactor {
    let presenter: Widget1Presenter

    init(presenter: Widget1Presenter) {
        self.presenter = presenter
    }

    func fetchData(request: Widget1Flow.FetchData.Request) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            let response = Widget1Flow.FetchData.Response(result: "Widget1")
            self?.presenter.presentData(response: response)
        }
    }
    
}
