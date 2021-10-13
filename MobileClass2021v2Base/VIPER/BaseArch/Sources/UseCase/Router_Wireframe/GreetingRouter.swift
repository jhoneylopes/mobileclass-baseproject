//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import Foundation
import UIKit

final class GreetingRouter: AppCoordinator {

    func routeToNextScreen(_ vc: UIViewController) {
        self.navigationController?.pushViewController(
            GreetingViewController(), animated: true
        )
    }
}
