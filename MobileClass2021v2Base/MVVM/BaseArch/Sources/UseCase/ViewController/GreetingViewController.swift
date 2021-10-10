//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import UIKit

class GreetingViewController : UIViewController {
    var viewModel: GreetingViewModelProtocol! {
        didSet {
            self.viewModel.greetingDidChange = { [unowned self] viewModel in
                self.greetingLabel.text = viewModel.greeting
            }
        }
    }

    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Navigation Title"
        self.view.backgroundColor = .orange
        
        self.showGreetingButton.addTarget(
            self,
            action: #selector(showGreeting),
            for: .touchUpInside
        )
    }

    @objc func showGreeting() {
        self.viewModel.showGreeting()
    }
}
