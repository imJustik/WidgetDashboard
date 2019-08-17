
import UIKit

class Widget4TableView: UITableView {
    let appearance = Appearance(); struct Appearance {
        let backgroundColor: UIColor = .red
    }

    init() {
        super.init(frame: .zero, style: .plain)
        configure()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var contentSize:CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }


    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }


    func configure() {
        isScrollEnabled = false
        showsVerticalScrollIndicator = false
        backgroundColor = appearance.backgroundColor
        separatorStyle = .none
        contentOffset = .zero
    }
}
