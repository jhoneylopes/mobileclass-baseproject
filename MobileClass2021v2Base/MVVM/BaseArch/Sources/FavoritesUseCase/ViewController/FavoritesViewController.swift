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
        case viewAnimate = 1, animateKeyframes, viewCoreAnimation, dynamicBehavior, changeColor
    }

    private func performAnimation(by index: Int) {
        switch index {
        case Animations.viewAnimate.rawValue:
            animateUpDown()
        case Animations.animateKeyframes.rawValue:
            animateKeyframes()
        case Animations.viewCoreAnimation.rawValue:
            viewCoreAnimation()
        case Animations.dynamicBehavior.rawValue:
            dynamicBehavior()
        case Animations.changeColor.rawValue:
            changeColor()
        default:
            break
        }
    }

    private func animateUpDown() {
        let viewCenter = self.viewCard.center
        UIView.animate(withDuration: 1.0) { [weak self] in
            let center = CGPoint(
                x: viewCenter.x ,
                y: viewCenter.y - 50
            )
            self?.viewCard.center = center
        } completion: { _ in
            let center = viewCenter
            self.viewCard.center = center
        }
    }

    private func animateKeyframes(start: CGPoint = .zero) {
        let endPoint: CGPoint = viewCard.center

        UIView.animateKeyframes(withDuration: 5,
          delay: 0,
          options: .calculationModeLinear,
          animations: {
            UIView.addKeyframe(
              withRelativeStartTime: 0.25,
              relativeDuration: 0.25) {
                self.viewCard.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.viewCard.center = CGPoint(x: self.view.bounds.width, y: start.y)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.viewCard.center = endPoint
            }
        })
    }

    private func viewCoreAnimation() {
        let currentCenter = viewCard.center
        let oldValue = viewCard.frame.width/2
        let componentWidth: CGFloat = 60

        // Do Animations
        CATransaction.begin()
        CATransaction.setAnimationDuration(2.0)
        CATransaction.setAnimationTimingFunction(
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        )

        // View animations
        UIView.animate(withDuration: 1.0) { [weak self] in
            self?.viewCard.frame = CGRect(
                x: 0, y: 0, width: componentWidth, height: componentWidth
            )
            self?.viewCard.center = .zero
        } completion: { _ in
            self.viewCard.center = currentCenter
        }

        // Layer animations
        let cornerAnimation = CABasicAnimation(
            keyPath: #keyPath(CALayer.cornerRadius)
        )
        cornerAnimation.fromValue = oldValue
        cornerAnimation.toValue = componentWidth/2

        // Se quisermos manter o estado após a animação
//        viewCard.layer.cornerRadius = componentWidth/2
        viewCard.layer.add(
            cornerAnimation,
            forKey: #keyPath(CALayer.cornerRadius)
        )

        CATransaction.commit()
    }

    var dynamicAnimator: UIDynamicAnimator!
    var gravityBehavior: UIGravityBehavior!
    var collisionBehavior: UICollisionBehavior!
    var bouncingBehavior: UIDynamicItemBehavior!

    private func dynamicBehavior() {

        let newView = UIView(
            frame: CGRect.init(x: 100, y: 0, width: 55, height: 100)
        )
        newView.backgroundColor = .green

        self.view.addSubview(newView)

        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)

        gravityBehavior = UIGravityBehavior(items: [newView])
        dynamicAnimator.addBehavior(gravityBehavior)

        collisionBehavior = UICollisionBehavior(items: [newView])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)

        //Adding the bounce effect
        bouncingBehavior = UIDynamicItemBehavior(items: [newView])
        bouncingBehavior.elasticity = 0.75
        dynamicAnimator.addBehavior(bouncingBehavior)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [newView] in
            newView.backgroundColor = .orange
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [newView] in
            newView.backgroundColor = .red
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 8) { [newView] in
            newView.removeFromSuperview()
            self.navigationController?.navigationBar.isHidden = true
        }
    }

    private func changeColor() {
        UIView.animate(withDuration: 3.0) { [weak self] in

            self?.viewCard.alpha = 0
            self?.viewCard.backgroundColor = .blue
        } completion: { [weak self] _ in
            self?.viewCard.alpha = 1
            self?.viewCard.backgroundColor = .green
        }
    }
}
