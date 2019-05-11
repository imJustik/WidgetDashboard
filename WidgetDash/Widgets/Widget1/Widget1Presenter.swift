//
//  Widget1Presenter.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

class Widget1Presenter {
    var viewController: Widget1ViewController? = nil

    func presentData(response: Widget1Flow.FetchData.Response) {
        let viewModel = Widget1Flow.FetchData.ViewModel.init(
            state: .display(
                response.result
            )
        )
        viewController?.display(viewModel: viewModel)
    }

}
