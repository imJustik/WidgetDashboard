import UIKit

protocol Widget1Delegate: AnyObject {
    func cellWasTapped(index: Int)
    func layout()
}

extension Widget1View {
    struct Appearance {
        var viewHeigth: CGFloat = 100
        let height: CGFloat = 0
        let inset: CGFloat = 12
    }
}

class Widget1View: UIView {
    var collectionView: Widget1CollectionView

    lazy var textLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    var appearance = Appearance()
    weak var delegate: Widget1Delegate?

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
        self.delegate = actionDelegate

        collectionView.isHidden = true
        textLabel.isHidden = true
        alpha = 0
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
        case .display:
            textLabel.isHidden = true
            collectionView.isHidden = false

            UIView.animate(withDuration: 0.3, animations: {
                self.snp.updateConstraints { make in
                    make.height.equalTo(self.appearance.viewHeigth)
                }
                DispatchQueue.main.async {
                    self.delegate?.layout()
                }
            }) { _ in
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1
                }
            }


        }
    }

    func makeConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(appearance.height)
        }

        textLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(appearance.inset)
        }

        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

