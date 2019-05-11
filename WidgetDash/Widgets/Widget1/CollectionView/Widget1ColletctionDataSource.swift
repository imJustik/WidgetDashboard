//
//  Widget1ColletctionDataSource.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 10/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import UIKit

class Widget1CollectionDataSource: NSObject, UICollectionViewDataSource {

    func numberOfSections(in _: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
        collectionView.register(Widget1CollectionCell.self, forCellWithReuseIdentifier: "Widget1Cell")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Widget1Cell", for: indexPath)
        return cell
    }
}
