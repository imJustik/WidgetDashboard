
import UIKit

final class Widget4ExpandView: UIView {
    let appearance = Appearance(); struct Appearance {
        let insets = 10
    }

    lazy var titleLabel: UILabel = UILabel()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGray
        addSubviews()
        makeConstraints()
        titleLabel.text = "Развернуть"
        titleLabel.textAlignment = .center
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {
        addSubview(titleLabel)
    }

    func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.left.right.equalToSuperview().inset(5)
        }
}

//extension AccountsWidgetExpandButtonView: ViewModelConfigurable {
//    typealias ViewModel = AccountWidgetCellViewModel.ExpandType
//
//    func configure(with viewModel: ViewModel) {
//        switch viewModel {
//        case let .shown(title):
//            titleLabel.text = title
//            countLabel.text = nil
//            arrowIcon.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
//        case let .hidden(title, itemsCount):
//            titleLabel.text = title
//            countLabel.text = String(itemsCount)
//            arrowIcon.transform = CGAffineTransform(rotationAngle: CGFloat(0))
//        }
//    }
//}
}
