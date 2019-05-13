import UIKit

protocol Widget3Delegate: AnyObject {
    func reloadFirst()
    func reloadBoth()
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
        button.setTitle("Обновить первый", for: .normal)
         button.addTarget(self, action: #selector(button1Action(_:)), for: .touchUpInside)
        return button
    }()

    lazy var button2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Обновить оба", for: .normal)
        button.addTarget(self, action: #selector(button2Action(_:)), for: .touchUpInside)
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
        buttonsView.addSubview(button2)
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

    @objc func button1Action(_ sender:UIButton!) {
        actionDelegate?.reloadFirst()
    }

    @objc func button2Action(_ sender:UIButton!) {
        actionDelegate?.reloadBoth()
    }

    func makeConstraints() {
        buttonsView.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.edges.equalToSuperview()
        }

        button1.snp.makeConstraints { make in
            make.width.equalTo(button2)
            make.leading.top.bottom.equalToSuperview()
        }

        button2.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.left.equalTo(button1.snp.right)
        }

        textLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(appearance.inset)
        }
    }
}

