import UIKit

extension Widget2ViewV2 {
    struct Appearance {
        let viewHeigth: CGFloat = 56
        let inset: CGFloat = 12
    }
}


class Widget2ViewV2: UIView {
    lazy var textLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    lazy var rightTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()

    let appearance = Appearance()

    init(title: String, backgroundColor: String, textColor: String) {
        super.init(frame: CGRect.zero)
        addSubviews()
        makeConstraints()
        textLabel.text = title

        self.backgroundColor = UIColor(hex: backgroundColor)
        textLabel.textColor = UIColor(hex: textColor)
        rightTitle.textColor = UIColor(hex: textColor)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {
        addSubview(textLabel)
        addSubview(rightTitle)
    }

    func show(state: Widget2ViewControllerV2.State) {
        switch state {
        case .loading:
            rightTitle.text = "..."
        case let .display(data):
            rightTitle.text = data
        }
    }

    func makeConstraints() {
        textLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        rightTitle.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        snp.makeConstraints { make in
            make.height.equalTo(appearance.viewHeigth)
        }

        textLabel.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(appearance.inset)
        }

        rightTitle.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview().inset(appearance.inset)
            make.left.equalTo(textLabel.snp.right)
        }
    }
}
