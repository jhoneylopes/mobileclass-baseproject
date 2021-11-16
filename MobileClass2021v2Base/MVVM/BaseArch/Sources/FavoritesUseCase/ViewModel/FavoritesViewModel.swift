//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import Foundation

protocol FavoritesViewModelProtocol: AnyObject {
    var didAnimateView: ((Int) -> Void)? { get set }
}

final class FavoritesViewModel: FavoritesViewModelProtocol {

    var didAnimateView: ((Int) -> Void)?

    init() {}

    func animateView(for index: Int) {
        didAnimateView?(index)
    }
}
