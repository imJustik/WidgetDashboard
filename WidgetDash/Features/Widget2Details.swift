//  Created by Илья Кузнецов on 15/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import UIKit

class Widget2Details: UIViewController {
    let label: UILabel = {
        let label = UILabel()
        label.text = "Вам одобрен кредит на сотку"
        return label
    }()

    override func viewDidLoad() {
        view?.backgroundColor = .white
        view?.addSubview(label)
        makeConstraints()
    }

    func makeConstraints() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
