import UIKit


protocol Widget4TableDelegate: AnyObject {
    func showAll()
}

class Widget4TableViewDelegate: NSObject, UITableViewDelegate {
    private var viewModels = [Widget4CellViewModel]()
    weak var delegate: Widget4TableDelegate?

    init(delegate: Widget4TableDelegate) {
        self.delegate = delegate
    }

    func configure(with viewModels: [Widget4CellViewModel]) {
        self.viewModels = viewModels
    }


    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = viewModels[indexPath.row]
        switch viewModel {
        case .account:
            print("select account")
        case .expand:
            delegate?.showAll()
        }
    }
}
