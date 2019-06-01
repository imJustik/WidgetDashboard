//  Created by Илья Кузнецов on 13/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.


class WidgetService {
    func fetchWidgets(completion: @escaping ([WidgetType.ModelType]) -> Void) {
        let json = [
            ["type": "widget1",
             "content": [
                "version": 1,
                "data": [
                    "uid":"w1"
                ]
                ]
            ],
            ["type": "container",
             "content": [
                "version": 1,
                "data": [
                    "uid":"cnr1",
                    "title": "Кредиты",
                    "deeplink": "alfa:///payments"
                ],
                "widgets": [
                    ["type": "widget2",
                     "content": [
                        "version": 1,
                        "data": [
                            "uid":"some3",
                            "title": "Кредитная карта"
                        ]
                        ]
                    ],

                    ["type": "widget2",
                     "content": [
                        "version": 1,
                        "data": [
                            "uid":"some1",
                            "title": "Потребительский"
                        ]
                        ]
                    ],
                    ["type": "widget2",
                     "content": [
                        "version": 1,
                        "data": [
                            "uid":"some2",
                            "title": "Ипотека"
                        ]
                        ]
                    ],
                    ["type": "container",
                     "content": [
                        "version": 1,
                        "data": [
                            "uid":"cnr2",
                            "title": "В другом банке"
                        ],
                        "widgets": [
                            ["type": "widget2",
                             "content": [
                                "version": 2,
                                "data": [
                                    "uid":"some11",
                                    "title": "Сбербанк",
                                    "backgroundColor": "#A0D77EFF",
                                    "textColor": "#FFFFFFFF"
                                ]
                                ]
                            ],
                            ["type": "widget2",
                             "content": [
                                "version": 2,
                                "data": [
                                    "uid":"some22",
                                    "title": "Газпромбанк",
                                    "backgroundColor": "#7E97D7FF",
                                    "textColor": "#FFFFFFFF"
                                ]
                                ]
                            ]
                        ]
                        ]
                    ],
                ]
                ]
            ],
            ["type": "widget3",
             "content": [
                "version": 1,
                "data": [
                    "uid":"w1",
                    "button1Text": "Обновить первый",
                    "button2Text": "Обновить все"
                ]
                ]
            ]
        ]

        let translator = WidgetTranslator()
        completion(translator.translateForm(array: json))
    }
}

