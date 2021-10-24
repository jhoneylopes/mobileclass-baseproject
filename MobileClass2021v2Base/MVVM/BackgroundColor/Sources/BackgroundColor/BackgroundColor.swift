// Copyright © 2017 Jhoney Lopes. All rights reserved.

import UIKit

public class BackgroundColor {

    public init() {}

    public func setGradientColorBackground(for label: UILabel) {
        label.backgroundGradient()
    }
}

extension UILabel {

    func backgroundGradient() {
        let gradient = getGradientLayer(bounds: self.bounds)
        self.textColor = gradientColor(
            bounds: self.bounds,
            gradientLayer: gradient
        )
    }

    func getGradientLayer(bounds : CGRect) -> CAGradientLayer{
        let gradient = CAGradientLayer()
        gradient.frame = bounds

        gradient.colors = [UIColor.red.cgColor,UIColor.blue.cgColor, UIColor.green.cgColor]

        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        return gradient
    }

    func gradientColor(bounds: CGRect, gradientLayer :CAGradientLayer) -> UIColor? {
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)

        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return UIColor(patternImage: image!)
    }
}
