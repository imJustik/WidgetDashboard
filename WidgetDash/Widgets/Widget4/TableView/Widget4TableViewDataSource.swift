import UIKit


class Widget4TableViewDataSource: NSObject, UITableViewDataSource {
    private var viewModels = [Widget4CellViewModel]()

    func configure(with viewModels: [Widget4CellViewModel]) {
        self.viewModels = viewModels
    }

    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        switch viewModel {
        case let .account(model):
            tableView.register(Widget4TableViewCell.self, forCellReuseIdentifier: "Widget4Cell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "Widget4Cell", for: indexPath) as! Widget4TableViewCell
            cell.configure(text: model.title)
            return cell
        case let .expand(model):
            tableView.register(Widget4ExpandCell.self, forCellReuseIdentifier: "Widget4ExpandCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "Widget4ExpandCell", for: indexPath) as! Widget4ExpandCell
            cell.configure(text: model.title)
            return cell
        }
    }
}
