import UIKit

protocol Widget1Delegate: AnyObject {
    func cellWasTapped(index: Int)
}

extension Widget1View {
    struct Appearance {
        let title = "Ебать виджет"
        let viewHeigth: CGFloat = 100
        let inset: CGFloat = 12
    }
}

class Widget1View: UIView {
    var collectionView: Widget1CollectionView

    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = appearance.title
        return label
    }()

    let appearance = Appearance()

    init(collectionFlowLayout: Widget1CollectionViewFlowLayout,
         collectionDataSource: Widget1CollectionDataSource,
         actionDelegate: Widget1Delegate) {

        collectionView = Widget1CollectionView(
            actionDelegate: actionDelegate,
            dataSource: collectionDataSource,
            layout: collectionFlowLayout)

        super.init(frame: CGRect.zero)
        addSubviews()
        makeConstraints()

        collectionView.isHidden = true
        textLabel.isHidden = true
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {
        addSubview(textLabel)
        addSubview(collectionView)
    }

    func show(state: Widget1ViewController.State) {
        switch state {
        case .loading:
            textLabel.isHidden = false
            collectionView.isHidden = true
            textLabel.text = "Загружаюсь..."
        case let .display(data):
            textLabel.isHidden = true
            collectionView.isHidden = false
        }
    }

    func makeConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(appearance.viewHeigth)
        }
        
        textLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(appearance.inset)
        }

        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

