import UIKit

class ScaleSegue: UIStoryboardSegue {
    override func perform() {
        destination.transitioningDelegate = self
        super.perform()
    }
}

extension ScaleSegue: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ScalePresentAnimator()
    }
}

class ScalePresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if let toViewController = transitionContext.viewController(forKey: .to) {
            let toView = transitionContext.view(forKey: .to)

            if let toView = toView {
                transitionContext.containerView.addSubview(toView)
            }

            let deviceWidth = UIScreen.main.bounds.width
            toView?.frame = CGRect(x: 0, y: 0, width: deviceWidth, height: 0)
            toView?.layoutIfNeeded()

            let duration = transitionDuration(using: transitionContext)
            let finalFrame = transitionContext.finalFrame(for: toViewController)

            UIView.animate(withDuration: duration) {
                toView?.frame = finalFrame
                toView?.layoutIfNeeded()
            } completion: { finished in
                transitionContext.completeTransition(finished)
            }
        }
    }
}
