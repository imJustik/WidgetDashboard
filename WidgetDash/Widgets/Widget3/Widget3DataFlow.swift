//
//  Widget3DataFlow.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation

enum Widget3Flow {
    enum FetchData {
        struct Request  { }

        struct Response {
            var result: String
        }

        struct ViewModel {
            var state: Widget3ViewController.State
        }
    }
}
