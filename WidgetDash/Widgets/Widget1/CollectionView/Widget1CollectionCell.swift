//
//  Widget1CollectionCell.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 10/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import UIKit

class Widget1CollectionCell: UICollectionViewCell {

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "icon")
        imageView.image = image
        return imageView
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "Петя"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()
        makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }

    func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.size.equalTo(60).priority(999)
            make.centerX.equalTo(label)
        }

        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(8)
        }
    }
}
