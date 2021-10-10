//  Copyright © 2017 Jhoney Lopes. All rights reserved.

protocol GreetingView: AnyObject {
    func setGreeting(greeting: String)
}

protocol GreetingViewPresenter {
    init(view: GreetingView, person: PersonDTO)
    func showGreeting()
}

class GreetingPresenter : GreetingViewPresenter {
    unowned let view: GreetingView
    let person: PersonDTO?
    
    required init(view: GreetingView, person: PersonDTO) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        guard let firstName = self.person?.firstName,
                let lastName = self.person?.lastName else {
            return
        }
        let greeting = "Hello" + " " + firstName + " " + lastName
        self.view.setGreeting(greeting: greeting)
    }
}
