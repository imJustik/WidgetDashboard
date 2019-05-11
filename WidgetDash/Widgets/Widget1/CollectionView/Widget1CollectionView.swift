//
//  Widget1CollectionView.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 10/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import UIKit

class Widget1CollectionView: UICollectionView {
    weak var actionDelegate: Widget1CollectionDelegate?

    init(actionDelegate: Widget1CollectionDelegate,
         dataSource: Widget1CollectionDataSource,
         layout: Widget1CollectionViewFlowLayout)
    {

        super.init(frame: CGRect.zero, collectionViewLayout: layout)
        super.delegate = self
        super.dataSource = dataSource
        self.actionDelegate = actionDelegate
        backgroundColor = .white

        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Widget1CollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select")
    }
    
}
