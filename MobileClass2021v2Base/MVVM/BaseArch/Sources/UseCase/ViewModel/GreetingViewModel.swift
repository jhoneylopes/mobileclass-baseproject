//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import Foundation

protocol GreetingViewModelProtocol: AnyObject {
    var greeting: String? { get }
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set } // function to call when greeting did change
    init(person: PersonDTO)
    func showGreeting()
}

class GreetingViewModel : GreetingViewModelProtocol {

    let person: PersonDTO?

    var greeting: String? {
        didSet {
            self.greetingDidChange?(self)
        }
    }
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())?

    required init(person: PersonDTO) {
        self.person = person
    }

    func showGreeting() {
        guard let firstName = self.person?.firstName,
              let lastName = self.person?.lastName else {
                  return
        }
        self.greeting = "Hello" + " " + firstName + " " + lastName
    }
}
