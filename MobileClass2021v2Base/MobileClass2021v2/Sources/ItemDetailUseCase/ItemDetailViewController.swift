import UIKit

protocol ItemDetailViewControllerDelegate: AnyObject {
    func popItemDetailViewController()
}

final class ItemDetailViewController: UIViewController {
    weak var delegate: ItemDetailViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    private func closeItemDetailViewController() {
        delegate?.popItemDetailViewController()
    }
}
