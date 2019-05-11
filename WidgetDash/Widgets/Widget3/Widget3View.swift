import UIKit

protocol Widget3Delegate: AnyObject {
    func refreshButtonTapped()
}

extension Widget3View {
    struct Appearance {
        let title = "Ебать виджет"
        let viewHeigth: CGFloat = 56
        let inset: CGFloat = 12
    }
}

class Widget3View: UIView {
    weak var actionDelegate: Widget3Delegate?
    lazy var buttonsView = UIView()

    lazy var button1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Обновить виджеты", for: .normal)
         button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        return button
    }()

    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = appearance.title
        return label
    }()

    let appearance = Appearance()

    init(actionDelegate: Widget3Delegate) {
        super.init(frame: CGRect.zero)
        addSubviews()
        makeConstraints()
        self.actionDelegate = actionDelegate

        buttonsView.isHidden = true
        textLabel.isHidden = true
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {
        addSubview(textLabel)
        addSubview(buttonsView)
        buttonsView.addSubview(button1)
    }

    func show(state: Widget3ViewController.State) {
        switch state {
        case .loading:
            buttonsView.isHidden = true
            textLabel.isHidden = false
            textLabel.text = "Загружаюсь..."
        case .display:
            buttonsView.isHidden = false
            textLabel.isHidden = true
        }
    }

    @objc func buttonAction(_ sender:UIButton!) {
        actionDelegate?.refreshButtonTapped()
    }

    func makeConstraints() {
        buttonsView.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.edges.equalToSuperview()
        }

        button1.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }

        textLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(appearance.inset)
        }
    }
}

