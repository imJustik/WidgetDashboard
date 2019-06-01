//
//  Widget1ViewController.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import UIKit

class Widget2ViewController: WidgetViewController {
    var model: Widget2Model.v1
    weak var externalDelegate: WidgetActionDelegate?
    let widgetSubscriber: HandlesWidgetSubscriptions?

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
        externalDelegate: WidgetActionDelegate,
        widgetSubscriber: HandlesWidgetSubscriptions?,
        model: Widget2Model.v1
        ) {
        self.model = model
        self.externalDelegate = externalDelegate
        self.widgetSubscriber = widgetSubscriber
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
        widgetSubscriber?.subscribe(eventType: .reloadBoth, uid: model.uid) { [weak self] in
            self?.set(state: .loading)
        }
    }

    override func loadView() {
        view = Widget2View(title: model.title)
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

extension Widget2ViewController: Reloadable {
    func reload() {
        set(state: .loading)
    }
}

protocol Widget2ActionDelegate: WidgetActionDelegate {}