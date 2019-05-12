

import SnapKit

extension DashboardView {
    struct Appearance {
        let refreshTintColor: UIColor = .gray
        let refreshBackgroundColor: UIColor = .white
        let headerViewMaxOpacity: CGFloat = 0.95
    }
}

class DashboardView: UIView {
    let appearance = Appearance()

    private(set) lazy var scrollView: UIScrollView = {
        let scroll = DashboardScrollView()
        return scroll
    }()

    private(set) lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()

    private(set) lazy var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.tintColor = appearance.refreshTintColor
        return control
    }()

    private lazy var indigoBackground: UIView = {
        let rect = CGRect(
            x: 0,
            y: -UIScreen.main.bounds.size.height,
            width: UIScreen.main.bounds.size.width,
            height: UIScreen.main.bounds.size.height
        )
        let view = UIView(frame: rect)
        view.backgroundColor = appearance.refreshBackgroundColor
        return view
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        makeConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.refreshControl = refreshControl
        scrollView.insertSubview(indigoBackground, at: 0)
    }

    private func makeConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
