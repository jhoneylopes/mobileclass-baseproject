//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import UIKit

final class GreetingViewController: UIViewController { // View + Controller
    var person: PersonDTO?
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .orange
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Navigation Title"
        self.showGreetingButton.addTarget(
            self,
            action: #selector(didTapButton(button:)),
            for: .touchUpInside
        )
    }

    @objc func didTapButton(button: UIButton) {
        guard let firstName = self.person?.firstName,
                let lastName = self.person?.lastName else {
            return
        }
        let greeting = "Hello" + " " + firstName + " " + lastName
        self.greetingLabel.text = greeting
    }
}
