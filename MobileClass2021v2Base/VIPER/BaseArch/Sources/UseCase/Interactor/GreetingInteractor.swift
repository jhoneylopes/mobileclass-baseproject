//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import Foundation

class GreetingInteractor: GreetingInteractorType {
    weak var output: GreetingOutput?

    /// Fake interactor for provider
    func provideGreetingData() {
        let person = PersonDTO(firstName: "FirstName", lastName: "LastName") // usually comes from data access layer
        let subject = person.firstName + " " + person.lastName
        let greeting = GreetingData(greeting: "Hello", subject: subject)
        self.output?.receiveGreetingData(greetingData: greeting)
    }
}
