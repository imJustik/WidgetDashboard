import UIKit

class Widget4TableViewCell: UITableViewCell {
    lazy var titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        makeConstraints()
        backgroundColor = .yellow
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {
        contentView.addSubview(titleLabel)
    }

    func configure(text: String) {
        titleLabel.text = text
    }

    func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
         make.edges.equalToSuperview().inset(25)
        }
    }
}
