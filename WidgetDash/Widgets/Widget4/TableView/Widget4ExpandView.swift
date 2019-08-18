//
//  Widget4ExpandView.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 18/08/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import UIKit

final class Widget4ExpandView: UIView {
    let appearance = Appearance(); struct Appearance {
        let insets = 10
    }

    lazy var expandButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Работой", for: .normal)
        button.addTarget(self, action: #selector(expand), for: .touchUpInside)
        return button
    }()

    var action: (()->Void)? = nil

    @objc func expand() {
        guard let action = action else { return }
        action()
    }


    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        addSubviews()
        makeConstraints()
        backgroundColor = .lightGray
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func configure(text: String) {
        expandButton.setTitle(text, for: .normal)
    }

    func addSubviews() {
        addSubview(expandButton)
    }

    func makeConstraints() {
        expandButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.left.right.equalToSuperview().inset(5)
        }
    }
}
