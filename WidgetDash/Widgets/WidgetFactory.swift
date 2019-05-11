//
//  WidgetFactory.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 30/04/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

//TODO: сделать WidgetService

import UIKit

enum WidgetType: String {
    case widget1 = "w1"
    case widget2 = "w2"
    case widget3 = "w3"
}

class WidgetFactory {
    let widgetStrings: [String]
    var widgets = [WidgetType]()
    var externalHandler: WidgetExternalDelegate?

    init(widgetStrings: [String]) {
        self.widgetStrings = widgetStrings
    }

    func getWidgets() -> [Widget] {
        return widgetStrings.compactMap {
            switch WidgetType.init(rawValue: $0)! {
            case .widget1:
                guard
                    let widget1Delegate = externalHandler as? Widget1ExternalDelegate
                else {  fatalError("Dashboard does not confirm this protocol") }

                let builder = Widget1Builder()
                return builder.build(externalDelegate: widget1Delegate)
            case .widget2:
                guard
                    let widget2Delegate = externalHandler as? Widget2ExternalDelegate
                else { fatalError("Dashboard does not confirm this protocol") }

                let builder = Widget2Builder()
                return builder.build(externalDelegate: widget2Delegate)
            case .widget3:
                guard
                    let widget3Delegate = externalHandler as? Widget3ExternalDelegate
                else { fatalError("Dashboard does not confirm this protocol") }

                let builder = Widget3Builder()
                return builder.build(externalDelegate: widget3Delegate)
            }
        }
    }
}



