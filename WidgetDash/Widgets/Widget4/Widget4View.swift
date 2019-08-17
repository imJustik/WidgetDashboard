import UIKit


protocol Widget4Delegate: AnyObject {
    func showAll()
    func layout()
}


extension Widget4View {
    struct Appearance {
        let estimatedRowHeight: CGFloat = 50
        let inset: CGFloat = 12
    }
}


class Widget4View: UIView {
    lazy var textLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    lazy var tableView = Widget4TableView()
    let appearance = Appearance()
    var tableDataSource: Widget4TableViewDataSource
    var tableDelegate: Widget4TableViewDelegate


    weak var actionDelegate: Widget4Delegate?

    init(actionDelegate: Widget4Delegate,
         tableDelegate: Widget4TableViewDelegate,
         tableDataSource: Widget4TableViewDataSource) {
        self.tableDataSource = tableDataSource
        self.tableDelegate = tableDelegate
        super.init(frame: CGRect.zero)
        addSubviews()
        makeConstraints()
        self.actionDelegate = actionDelegate
        tableView.delegate = tableDelegate
        tableView.dataSource = tableDataSource

    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {
        addSubview(textLabel)
        addSubview(tableView)
    }

    func show(state: Widget4ViewController.State) {
        switch state {
        case .loading:
            textLabel.isHidden = false
            tableView.isHidden = true
            textLabel.text = "Загружаемся"
        case .displayFirstThree(let data):
            tableDataSource.configure(with: data)
            tableDelegate.configure(with: data)
            textLabel.isHidden = true
            tableView.isHidden = false
            tableView.reloadData()
            print("show all content\(tableView.contentSize)")
            print("show all intrinsicContentSize \(tableView.intrinsicContentSize)")
            actionDelegate?.layout()
        case .displayAll(let data):
            tableDataSource.configure(with: data)
            tableDelegate.configure(with: data)
            tableView.reloadData()
            print("show all content\(tableView.contentSize)")
            print("show all intrinsicContentSize \(tableView.intrinsicContentSize)")
            actionDelegate?.layout()
        }
    }
}

extension Widget4View {
    func makeConstraints() {
        
        textLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(appearance.inset)
        }

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

