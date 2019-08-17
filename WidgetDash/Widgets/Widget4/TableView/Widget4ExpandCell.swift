
import UIKit

final class Widget4ExpandCell: UITableViewCell {
    let appearance = Appearance(); struct Appearance {
        let insets = 10
    }

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        makeConstraints()
        selectionStyle = .none
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func configure(text: String) {
        titleLabel.text = text
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
