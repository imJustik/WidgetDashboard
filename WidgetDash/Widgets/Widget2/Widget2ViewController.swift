//
//  Widget1ViewController.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import UIKit

class Widget2ViewController: WidgetViewController {
    weak var externalDelegate: WidgetExternalDelegate?

    let interactor: Widget2Interactor
    lazy var contentView = view as? Widget2View
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

    init(
        interactor: Widget2Interactor,
        state: State,
        externalDelegate: WidgetExternalDelegate) {
        guard let external = externalDelegate as? Widget2ExternalDelegate else {
            fatalError("You cannot init with this delegate type")
        }
        self.externalDelegate = external
        self.interactor = interactor
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(state: State) {
        self.state = state
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set(state: state)
    }

    override func loadView() {
        view = Widget2View()
    }

    func fetchData() {
        let request = Widget2Flow.FetchData.Request()
        interactor.fetchData(request: request)
    }

    func display(viewModel: Widget2Flow.FetchData.ViewModel) {
        self.state = viewModel.state
    }
}

extension Widget2ViewController {
    enum State {
        case loading
        case display(String)
    }
}

protocol Widget2ExternalDelegate: WidgetExternalDelegate {
    func widget2ButtonTapped()
}
