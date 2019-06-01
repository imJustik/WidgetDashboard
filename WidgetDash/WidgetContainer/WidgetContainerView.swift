//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import UIKit
import SnapKit

protocol ContainerViewDelegate: AnyObject {
    func tapButton()
}

class WidgetContainerView: UIControl {
    weak var delegate: ContainerViewDelegate?
    var widgetViews: [UIView] = []

    lazy var headerView = UIView()
    let hasAction: Bool

    lazy var headerTitle: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(headerButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    lazy var actionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_add__m"), for: .normal)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(actionButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()


    public init(title: String, needAction: Bool = false) {
        hasAction = needAction
        super.init(frame: .zero)
        addSubviews()
        makeConstraints()
        stackView.addArrangedSubview(headerView)
        headerTitle.setTitle(title, for: .normal)
    }

    public required init?(coder _: NSCoder) {
        fatalError()
    }

    @objc func actionButtonTapped(_ sender:UIButton!) {
        delegate?.tapButton()
    }

    @objc func headerButtonTapped(_ sender:UIButton!) {
        widgetViews.forEach { widget in
            if widget.isHidden {
                UIView.animate(withDuration: 0.15) {
                    widget.alpha = 1
                    widget.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.15) {
                    widget.alpha = 0
                    widget.isHidden = true
                }
            }
        }
    }

    func add(view: UIView) {
        widgetViews.append(view)
        stackView.addArrangedSubview(view)
    }

    private func addSubviews() {
        headerView.addSubview(headerTitle)
        addSubview(stackView)
        if hasAction {
            headerView.addSubview(actionButton)
            makeConstraintsWithAction()
            return
        }
        makeConstraintsWithOutAction()
    }

    func makeConstraintsWithAction() {
        headerTitle.setContentHuggingPriority(.defaultLow, for: .horizontal)
        actionButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        headerTitle.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(8)
            make.right.equalTo(actionButton.snp.left).offset(-8)
        }

        actionButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().inset(12)
        }
    }

    func makeConstraintsWithOutAction() {
        headerTitle.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }

    private func makeConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}
