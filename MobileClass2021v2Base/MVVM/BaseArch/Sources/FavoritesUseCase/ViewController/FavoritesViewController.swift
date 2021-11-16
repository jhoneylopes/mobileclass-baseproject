//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import UIKit

final class FavoritesViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var viewCard: UIView!


    // MARK:

    var viewModel: FavoritesViewModelProtocol! {
        didSet {
            self.viewModel.didAnimateView = { [weak self] index in
                self?.makeViewUpdate(index: index)
            }            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func makeViewUpdate(index: Int) {
        print(index)
    }

    @IBAction func didTapAnimateButton(_ sender: UIButton) {
        performAnimation(by: sender.tag)
    }

    enum Animations: Int {
        case resize = 1
    }

    private func performAnimation(by index: Int) {
        switch index {
        case Animations.resize.rawValue:
            let viewCenter = self.viewCard.center
            UIView.animate(withDuration: 1.0) { [weak self] in
                let center = CGPoint(
                    x: viewCenter.x ,
                    y: viewCenter.y - 25
                )
                self?.viewCard.center = center
            } completion: { _ in
                let center = viewCenter
                self.viewCard.center = center
            }

        default:
            break
        }
    }
}
