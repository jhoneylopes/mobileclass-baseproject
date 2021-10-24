// Copyright © 2017 Jhoney Lopes. All rights reserved.

import UIKit

public protocol SampleLabelInjectionType {
    func updateBackground(label: UILabel)
}

public class SampleLabel: UILabel {

    var objInject: SampleLabelInjectionType?

    public func setInjection(objInject: SampleLabelInjectionType) {
        self.objInject = objInject
    }

    public func updateSampleLabel() {
        objInject?.updateBackground(label: self)
    }
}
