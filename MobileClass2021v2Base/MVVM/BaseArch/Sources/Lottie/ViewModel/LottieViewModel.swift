//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import Foundation

protocol LottieViewModelProtocol: AnyObject {
    var didAnimateView: ((Int) -> Void)? { get set }
}

final class LottieViewModel: LottieViewModelProtocol {

    var didAnimateView: ((Int) -> Void)?

    init() {}

    func animateView(for index: Int) {
        didAnimateView?(index)
    }
}
