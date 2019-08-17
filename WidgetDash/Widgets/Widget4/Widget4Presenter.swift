//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

class Widget4Presenter {
    var viewController: Widget4ViewController? = nil

    func presentFirstThree(response: Widget4Flow.FetchData.Response) {
        let accounts = response.result.map {Widget4CellViewModel.account(Widget4AccountCellViewModel(title: $0))}
        let expand = Widget4CellViewModel.expand(Widget4ExpandCellViewModel(title: "Развернуть"))
        let viewModels = accounts + [expand]
        let viewModel = Widget4Flow.FetchData.ViewModel.init(
            state: .displayFirstThree(
                viewModels
            )
        )
        viewController?.display(viewModel: viewModel)

    }

    func presentAll(response: Widget4Flow.FetchData.Response) {
        let accounts = response.result.map {Widget4CellViewModel.account(Widget4AccountCellViewModel(title: $0))}
        let expand = Widget4CellViewModel.expand(Widget4ExpandCellViewModel(title: "Свернуть"))
        let viewModels = accounts + [expand]
        let viewModel = Widget4Flow.FetchData.ViewModel.init(
            state: .displayAll(
                viewModels
            )
        )
        viewController?.display(viewModel: viewModel)
    }
}
