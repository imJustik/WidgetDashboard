//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import UIKit

class Widget4ViewController: WidgetViewController {
    let uid: String = "w4"

    weak var externalDelegate: WidgetActionDelegate?
    let widgetSubscriber: HandlesWidgetSubscriptions?
    
    let interactor: Widget4Interactor
    lazy var contentView = view as? Widget4View

    var state: State {
        didSet(oldState) {
            switch (oldState, state) {
            case (_, .loading):
                contentView?.show(state: .loading)
                getAllData()
            case let(_, .displayAll(data)):
                contentView?.show(state: .displayAll(data))
        }
        }
    }

    init(interactor: Widget4Interactor,
         state: State,
         externalDelegate: WidgetActionDelegate,
         widgetSubscriber: HandlesWidgetSubscriptions?) {
        
        self.externalDelegate = externalDelegate
        self.widgetSubscriber = widgetSubscriber

        self.interactor = interactor
        self.state = state
        super.init(nibName: nil, bundle: nil)
        subscribeToActions()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = Widget4View(
            actionDelegate: self,
            tableDelegate: Widget4TableViewDelegate(delegate: self),
            tableDataSource:  Widget4TableViewDataSource())
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        set(state: state)
    }

    func subscribeToActions() {
        widgetSubscriber?.subscribe(eventType: .reloadFaces, uid: uid) { [weak self] in
            self?.set(state: .loading)
        }

        widgetSubscriber?.subscribe(eventType: .reloadBoth, uid: uid) { [weak self] in
            self?.set(state: .loading)
        }
    }

    func set(state: State) {
        self.state = state
    }

    func getAllData() {
        let request = Widget4Flow.FetchData.Request()
        interactor.getAll(request: request)
    }

    func display(viewModel: Widget4Flow.FetchData.ViewModel) {
        self.state = viewModel.state
    }
}

extension Widget4ViewController {
    enum State {
        case loading
        case displayAll([Widget4CellViewModel])
    }
}

extension Widget4ViewController: Widget4Delegate {

    func layout() {
        print("layout")
        (externalDelegate as? Widget4ActionDelegate)?.layout2()
    }
}

extension Widget4ViewController: Reloadable {
    func reload() {
        set(state: .loading)
    }
}

extension Widget4ViewController: Widget4TableDelegate {
    func showAll() {
        let request = Widget4Flow.FetchData.Request()
        switch self.state {
        case .displayAll:
            interactor.getAll(request: request)
        default:
            break
        }
    }
}

protocol Widget4ActionDelegate: WidgetActionDelegate {
    func layout2()
}



