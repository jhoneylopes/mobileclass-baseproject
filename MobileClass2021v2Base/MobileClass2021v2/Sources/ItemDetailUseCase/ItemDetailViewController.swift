import UIKit

protocol ItemDetailViewControllerDelegate: AnyObject {
    func popItemDetailViewController()
}

final class ItemDetailViewController: UIViewController {
    weak var delegate: ItemDetailViewControllerDelegate?

    private func closeItemDetailViewController() {
        delegate?.popItemDetailViewController()
    }
}
