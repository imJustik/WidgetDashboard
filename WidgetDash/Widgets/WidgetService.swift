//
//  WidgetService.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 13/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import Foundation


class WidgetService {
    func fetchWidgets(completion: @escaping ([String]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completion(["w1","w2","w3"])
        }
    }
}
