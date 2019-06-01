//
//  Widget1Presenter.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

class Widget2PresenterV2 {
    var viewController: Widget2ViewControllerV2? = nil

    func presentData(response: Widget2FlowV2.FetchData.Response) {
        let viewModel = Widget2FlowV2.FetchData.ViewModel.init(
            state: .display(
                title: response.result
            )
        )
        viewController?.display(viewModel: viewModel)
    }

}
