import UIKit

extension Widget2View {
    struct Appearance {
        let title = "Ебать виджет"
        let viewHeigth: CGFloat = 56
        let inset: CGFloat = 12
    }
}

class Widget2View: UIView {
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = appearance.title
        return label
    }()

    let appearance = Appearance()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        makeConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {
        addSubview(textLabel)
    }

    func show(state: Widget2ViewController.State) {
        switch state {
        case .loading:
            textLabel.text = "Загружаюсь..."
        case let .display(data):
            textLabel.text = data
        }
    }

    func makeConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(appearance.viewHeigth)
        }
        
        textLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(appearance.inset)
        }
    }
}

