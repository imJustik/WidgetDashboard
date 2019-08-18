//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import Foundation

class Widget4Interactor {
    let presenter: Widget4Presenter
    let dataStore: Widget4DataStore

    init(presenter: Widget4Presenter, dataStore: Widget4DataStore) {
        self.presenter = presenter
        self.dataStore = dataStore
    }

//    func getFirstThree(request: Widget4Flow.FetchData.Request) {
//        if dataStore.labels.isEmpty {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
//                guard let self = self else { return }
//                self.dataStore.labels = ["Текст1", "Текст2", "Текст3", "Текст4","Текст5", "Текст6"]
//                let response = Widget4Flow.FetchData.Response(result: Array(self.dataStore.labels.prefix(3)))
//                self.presenter.presentFirstThree(response: response)
//            }
//        } else {
//            let response = Widget4Flow.FetchData.Response(result: Array(self.dataStore.labels.prefix(3)))
//            self.presenter.presentFirstThree(response: response)
//        }
//    }

    func getAll(request: Widget4Flow.FetchData.Request) {
        if dataStore.labels.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
                guard let self = self else { return }
                self.dataStore.labels = ["Текст1", "Текст2", "Текст3", "Текст4","Текст5", "Текст6"]
                let response = Widget4Flow.FetchData.Response(result: Array(self.dataStore.labels))
                self.presenter.presentAll(response: response)
            }
        } else {
            let response = Widget4Flow.FetchData.Response(result: Array(self.dataStore.labels))
            self.presenter.presentAll(response: response)
        }
    }
    
}
