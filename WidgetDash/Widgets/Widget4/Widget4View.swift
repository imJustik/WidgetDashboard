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
    var isExpanded = false

    var data: [Widget4CellViewModel] = []

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
        let footer = Widget4ExpandView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 50))
        footer.action = { [weak self] in
            self?.expand()
        }
        tableView.tableFooterView = footer

    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func expand() {
        if isExpanded == false {
            tableDataSource.configure(with: data)
            tableDelegate.configure(with: data)

            //Высчитываем встравляемые ячейки
            var paths: [IndexPath] = []
            for  (index, _) in data.dropFirst(3).enumerated() {
                let indexPath = IndexPath(row: 3+index, section: 0)
                paths.append(indexPath)
            }

            tableView.beginUpdates()
            self.tableView.reloadSections(IndexSet(integersIn: 0...0), with: .automatic)
           // self.tableView.insertRows(at: paths, with: .bottom)
            tableView.endUpdates()

            isExpanded = true
            UIView.animate(withDuration: 0.3) {
                self.actionDelegate?.layout()
            }

        } else {
            tableDataSource.configure(with: Array(data.prefix(3)))
            tableDelegate.configure(with: Array(data.prefix(3)))

            var paths: [IndexPath] = []
            for  (index, _) in data.dropFirst(3).enumerated() {
                let indexPath = IndexPath(row: 3+index, section: 0)
                paths.append(indexPath)
            }
            tableView.beginUpdates()
            self.tableView.reloadSections(IndexSet(integersIn: 0...0), with: .automatic)
          //  self.tableView.deleteRows(at: paths, with: .top)
            tableView.endUpdates()
            UIView.animate(withDuration: 0.3) {
                self.actionDelegate?.layout()
            }
            isExpanded = false
        }
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
        case .displayAll(let data):
            textLabel.isHidden = true
            tableView.isHidden = false
            self.data = data
            tableDataSource.configure(with: Array(data.prefix(3)))
            tableDelegate.configure(with: Array(data.prefix(3)))
            tableView.reloadData()
            print("show all intrinsicContentSize \(tableView.intrinsicContentSize)")
        }
    }
}



extension Widget4View {
    func makeConstraints() {
        textLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(appearance.inset)
        }

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

/*

 if isExpanded == false {
 print("**********")
 print("show all content\(tableView.contentSize)")
 print("show all intrinsicContentSize \(tableView.intrinsicContentSize)")
 print("**********")
 tableView.reloadData()
 self.snp.updateConstraints {make in
 make.height.equalTo(tableView.intrinsicContentSize)
 }
 print("show all content\(tableView.contentSize)")
 print("show all intrinsicContentSize \(tableView.intrinsicContentSize)")
 actionDelegate?.layout()
 } else {
 // self.tableView.beginUpdates()
 tableView.reloadData()
 // self.tableView.deleteRows(at: [IndexPath.init(row: 4, section: 0), IndexPath.init(row: 5, section: 0), IndexPath.init(row: 6, section: 0)], with: .top)
 // self.tableView.endUpdates()

 UIView.animate(withDuration: 3, animations: {
 print(self.tableView.intrinsicContentSize.height)
 self.snp.updateConstraints {make in
 make.height.equalTo(252.0)
 }
 self.actionDelegate?.layout()
 }) { _ in

 }
 isExpanded = false
 }

 */


/*


 case .displayFirstThree(let data):
 tableDataSource.configure(with: data)
 tableDelegate.configure(with: data)
 textLabel.isHidden = true
 tableView.isHidden = false

 print("show all intrinsicContentSize \(tableView.intrinsicContentSize)")
 UIView.animate(withDuration: 0.5, animations: {
 self.snp.updateConstraints {make in
 make.height.equalTo(252)
 }
 self.actionDelegate?.layout()
 }) { _ in
 self.tableView.reloadData()
 }
 case .displayAll(let data):
 tableDataSource.configure(with: data)
 tableDelegate.configure(with: data)
 tableView.reloadData()
 print("show all intrinsicContentSize \(tableView.intrinsicContentSize)")
 UIView.animate(withDuration: 0.5, animations: {
 self.snp.updateConstraints {make in
 make.height.equalTo(self.tableView.intrinsicContentSize)
 }
 self.actionDelegate?.layout()
 }) { _ in
 self.actionDelegate?.layout()
 self.tableView.layoutIfNeeded()
 }
 }


 */


/*

 } else {
 print("show all intrinsicContentSize \(tableView.intrinsicContentSize)")
 UIView.animate(withDuration: 0.5, animations: {
 self.snp.updateConstraints {make in
 make.height.equalTo(500)
 }
 self.actionDelegate?.layout()
 }) { _ in
 self.actionDelegate?.layout()
 self.tableView.layoutIfNeeded()
 }
 }

 */

