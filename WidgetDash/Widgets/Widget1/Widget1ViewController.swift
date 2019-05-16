//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.

import UIKit

class Widget1ViewController: WidgetViewController {
    let uid: UUID = UUID()

    weak var externalDelegate: WidgetActionDelegate?
    let widgetSubscriber: HandlesWidgetSubscriptions?
    
    let interactor: Widget1Interactor
    lazy var contentView = view as? Widget1View

    let collectionFlowLayout = Widget1CollectionViewFlowLayout()
    let collectionDataSource = Widget1CollectionDataSource()


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

    init(interactor: Widget1Interactor,
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

    override func loadView() {
        view = Widget1View(
            collectionFlowLayout: collectionFlowLayout,
            collectionDataSource: collectionDataSource,
            actionDelegate: self)
    }

    func set(state: State) {
        self.state = state
    }

    func fetchData() {
        let request = Widget1Flow.FetchData.Request()
        interactor.fetchData(request: request)
    }

    func display(viewModel: Widget1Flow.FetchData.ViewModel) {
        self.state = viewModel.state
    }
}

extension Widget1ViewController {
    enum State {
        case loading
        case display(String)
    }
}

extension Widget1ViewController: Widget1Delegate {
    func cellWasTapped(index: Int) {
        (externalDelegate as? Widget1ActionDelegate)?.cellWasTapped(index: index)
    }
}

extension Widget1ViewController: Reloadable {
    func reload() {
        set(state: .loading)
    }
}

protocol Widget1ActionDelegate: WidgetActionDelegate {
    func cellWasTapped(index: Int)
}


