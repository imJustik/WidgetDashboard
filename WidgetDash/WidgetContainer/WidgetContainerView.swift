//
//  WidgetContainerView.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import UIKit
import SnapKit

class WidgetContainerView: UIControl {
    let appearance = Appearance(); struct Appearance {
        let separatorColor: UIColor = .darkGray
        let defaultBackgroundColor: UIColor = .white
        let selectedBackgroundColor: UIColor = .gray
        let separatorHeight: CGFloat = 1.0
    }

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = appearance.separatorColor
        return view
    }()

    private weak var view: UIView?

    public override var isHighlighted: Bool {
        didSet {
            updateBackground()
        }
    }

    public override var isSelected: Bool {
        didSet {
            updateBackground()
        }
    }

    public init() {
        super.init(frame: .zero)
        addSubviews()
        makeConstraints()
        setSeparatorHidden(true)
        setSelectable(false)
    }

    public required init?(coder _: NSCoder) {
        fatalError()
    }

    private func addSubviews() {
        addSubview(separatorView)
    }

    private func makeConstraints() {
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(appearance.separatorHeight)
            make.left.right.bottom.equalToSuperview()
        }
    }

    public func configure(with view: UIView) {
        if let currentView = self.view {
            currentView.removeFromSuperview()
        }

        self.view = view
        insertSubview(view, belowSubview: separatorView)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    public func setSeparatorHidden(_ hidden: Bool) {
        separatorView.isHidden = hidden
    }

    public func setSeparatorInsets(_ insets: UIEdgeInsets) {
        separatorView.snp.updateConstraints { make in
            make.left.right.equalToSuperview().inset(insets)
        }
    }

    public func setSelectable(_ selectable: Bool) {
        isEnabled = selectable
        backgroundColor = selectable ? appearance.defaultBackgroundColor : .clear
    }

    private func updateBackground() {
        backgroundColor = isHighlighted || isSelected
            ? appearance.selectedBackgroundColor
            : appearance.defaultBackgroundColor
    }
}
