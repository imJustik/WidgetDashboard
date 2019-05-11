//
//  DashboardPresenter.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import UIKit

class DashboardPresenter {
    var viewController: Dashboard? = nil
    
    func presentWidgets(response: DashboardFlow.SetupWidgets.Response) {
        let viewModel = DashboardFlow.SetupWidgets.ViewModel.init(state: .displayWidgets(response.result))
        viewController?.display(viewModel: viewModel)
    }
}
