//
//  Widget1ViewController.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import UIKit

class Widget3ViewController: WidgetViewController {
    let interactor: Widget3Interactor
    lazy var contentView = view as? Widget3View
    weak var externalDelegate: WidgetExternalDelegate?

    var state: State {
        didSet(oldState) {
            switch (oldState, state) {
            case (_, .loading):
                contentView?.show(state: .loading)
                fetchData()
            case let (_, .display(data)):
                contentView?.show(state: .display(data))
            }
        }
    }

    init(interactor: Widget3Interactor, state: State) {
        self.interactor = interactor
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set(state: state)
    }

    override func loadView() {
        view = Widget3View(actionDelegate: self)
    }

    func set(state: State) {
        self.state = state
    }

    func fetchData() {
        let request = Widget3Flow.FetchData.Request()
        interactor.fetchData(request: request)
    }

    func display(viewModel: Widget3Flow.FetchData.ViewModel) {
        self.state = viewModel.state
    }
}

extension Widget3ViewController {
    enum State {
        case loading
        case display(String)
    }
}
extension Widget3ViewController: Widget3Delegate {
    func refreshButtonTapped() {
        (externalDelegate as? Widget3ExternalDelegate)?.widget3buttonTapped()
        print("Button tapped")
    }
}

// Протокол взаимодействия с внешним миром
protocol Widget3ExternalDelegate: WidgetExternalDelegate {
    func widget3buttonTapped()
}
