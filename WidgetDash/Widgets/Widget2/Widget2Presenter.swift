//
//  Widget1Presenter.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

class Widget2Presenter {
    var viewController: Widget2ViewController? = nil

    func presentData(response: Widget2Flow.FetchData.Response) {
        let viewModel = Widget2Flow.FetchData.ViewModel.init(
            state: .display(
                response.result
            )
        )
        viewController?.display(viewModel: viewModel)
    }

}
