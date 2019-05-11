//
//  Widget1Presenter.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

class Widget3Presenter {
    var viewController: Widget3ViewController? = nil

    func presentData(response: Widget3Flow.FetchData.Response) {
        let viewModel = Widget3Flow.FetchData.ViewModel.init(
            state: .display(
                response.result
            )
        )
        viewController?.display(viewModel: viewModel)
    }

}
