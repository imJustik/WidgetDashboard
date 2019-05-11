//
//  Widget1ViewController.swift
//  WidgetDash
//
//  Created by Илья Кузнецов on 09/05/2019.
//  Copyright © 2019 Илья Кузнецов. All rights reserved.
//

import UIKit

class Widget1ViewController: WidgetViewController {
    weak var externalDelegate: WidgetExternalDelegate?
    
    let interactor: Widget1Interactor
    lazy var contentView = view as? Widget1View


    let collectionFlowLayout = Widget1CollectionViewFlowLayout()
    let collectionDataSource = Widget1CollectionDataSource()
    let actionDelegate = Widget1CollectionDelegate()

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
         externalDelegate: WidgetExternalDelegate) {
        
        guard let external = externalDelegate as? Widget1ExternalDelegate else {
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
        view = Widget1View(
            collectionFlowLayout: collectionFlowLayout,
            collectionDataSource: collectionDataSource,
            actionDelegate: actionDelegate)
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

protocol Widget1ExternalDelegate: WidgetExternalDelegate {
    func widget1ButtonTapped()
}
