//  Created by Илья Кузнецов on 13/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.


class WidgetService {
    func fetchWidgets(completion: @escaping ([WidgetModelType]) -> Void) {
        let arr = [
            ["id": "widget1",
             "widgetData":
                [
                    "container": [
                        "type": "basic",
                        "title": "Переводы",
                        "deeplink": "deeplink1"
                    ]
                ]
            ],

            ["id": "widget2",
             "widgetData":
                [
                    "title": "Текст виджета 2"
                ]
            ],

            ["id": "widget3",
             "widgetData":
                [
                    "button1Text": "Обновить первый",
                    "button2Text": "Обновить оба"
                ]
            ],
        ]

        let translator = WidgetTranslator()
        completion(translator.translateForm(array: arr))
    }
}


//        let widget1 = WidgetModel(
//            type: .widget1,
//            container: WidgetContainerModel(
//                type: .basic,
//                title: "Переводы",
//                deeplink: "Диплинк в переводы"
//            )
//        )
//
//        let widget2 = WidgetModel(
//            type: .widget2,
//            container: WidgetContainerModel(
//                type: .basic,
//                title: "Кредиты",
//                deeplink: "Диплинк в кредиты"
//            )
//        )
//
//        let widget3 = WidgetModel(type: .widget3)


// Расскоментировать, что бы создать widget3 с контейнером
//        let widget3 = WidgetModel(
//            type: .widget3,
//            container: WidgetContainerModel(
//                    type: .basic,
//                    title: "Кредиты",
//                    deeplink: "Диплинк в кредиты"
//            )
//        )
