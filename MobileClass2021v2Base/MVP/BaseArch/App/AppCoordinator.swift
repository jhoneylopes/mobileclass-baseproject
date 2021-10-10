//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import Foundation
import UIKit

protocol AppCoordinatorType {
    func root()
}

final class AppCoordinator: AppCoordinatorType {

    var window: UIWindow?
    var windowScene: UIWindowScene?
    var navigationController: UINavigationController?

    public init(window: UIWindow?, windowScene: UIWindowScene) {
        self.window = window
        self.windowScene = windowScene
    }

    public func start() {
        self.window = UIWindow(frame: .zero)
        self.window?.makeKeyAndVisible()
        self.window?.backgroundColor = .white
        self.window?.windowScene = windowScene

        root()
    }
    
    func root() {
        self.navigationController = UINavigationController(
            rootViewController: makeRootViewController()
        )
        window?.rootViewController = self.navigationController
    }

    func makeRootViewController() -> UIViewController {
        return GreetingViewController()
    }
}
