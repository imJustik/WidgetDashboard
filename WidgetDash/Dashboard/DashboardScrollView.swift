import UIKit

class DashboardScrollView: UIScrollView {
    public init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        keyboardDismissMode = .onDrag
        showsVerticalScrollIndicator = false
        canCancelContentTouches = true
        if #available(iOS 11.0, *) {
            contentInsetAdjustmentBehavior = .never
        }
    }

    required init?(coder _: NSCoder) {
        fatalError()
    }

    override func touchesShouldCancel(in _: UIView) -> Bool {
        return true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if #available(iOS 11, *) {
            contentInset.bottom = safeAreaInsets.bottom
        }
    }
}
