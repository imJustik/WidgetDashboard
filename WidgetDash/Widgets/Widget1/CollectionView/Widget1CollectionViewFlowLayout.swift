//
//  Widget1CollectionViewFlowLayout.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 10/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import UIKit

class Widget1CollectionViewFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        minimumLineSpacing = 18
        sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        scrollDirection = .horizontal
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
