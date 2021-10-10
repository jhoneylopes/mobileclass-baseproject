//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import UIKit

class GreetingViewController : UIViewController, GreetingView { // View = ViewController
    var presenter: GreetingViewPresenter?
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Navigation Title"
        self.view.backgroundColor = .orange
        
        self.showGreetingButton.addTarget(
            self,
            action: #selector(didTapButton(button:)),
            for: .touchUpInside
        )
    }

    @objc func didTapButton(button: UIButton) {
        self.presenter?.showGreeting()
    }

    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}
