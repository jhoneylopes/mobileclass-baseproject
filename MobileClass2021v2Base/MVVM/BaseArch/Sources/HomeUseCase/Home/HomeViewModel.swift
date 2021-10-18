//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    var homeDetailsIdentifier: String { get }
    var didTapCell: ((_ identifier: String) -> Void)? { get set }
    func goToHomeDetails()
}

class HomeViewModel: HomeViewModelProtocol {

    var homeDetailsIdentifier = "HomeDetailViewController"

    var didTapCell: ((String) -> ())?

    func goToHomeDetails() {
        didTapCell?(homeDetailsIdentifier)
    }
}
