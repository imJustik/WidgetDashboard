
import UIKit

enum Widget4CellViewModel {
    case account(Widget4AccountCellViewModel)
    case expand(Widget4ExpandCellViewModel)
}

struct Widget4AccountCellViewModel {
    let title: String
}

struct Widget4ExpandCellViewModel {
    let title: String
}
