//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import UIKit
import Lottie

final class LottieViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var lottieView: UIView!
    private let animationView = AnimationView()

    // MARK:

    var viewModel: LottieViewModelProtocol! {
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
        case anim1 = 1
    }

    private func performAnimation(by index: Int) {
        let files: [String] = ["", "404", "bouncingshapes", "gamingtime"]
        guard let file = files[safe: index] else {
            return
        }
        doAnimation(from: file)
    }

    private func doAnimation(from file: String) {
        self.animationView.removeFromSuperview()

        let contentSize = self.lottieView.frame.size


        animationView.frame = CGRect(
            x: 0, y: 0,
            width: contentSize.width,
            height: contentSize.height
        )
        /// Some time later
        let animation = Animation.named(file)
        animationView.animation = animation

        lottieView.addSubview(animationView)

        animationView.play { [weak self] _ in
            self?.animationView.removeFromSuperview()
        }
    }
}

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
