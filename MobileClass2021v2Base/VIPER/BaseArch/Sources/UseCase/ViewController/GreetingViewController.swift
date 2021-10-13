import UIKit

class GreetingViewController : UIViewController, GreetingView {
    var eventHandler: GreetingViewEventHandler?
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
        self.eventHandler?.didTapShowGreetingButton()
    }

    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}
