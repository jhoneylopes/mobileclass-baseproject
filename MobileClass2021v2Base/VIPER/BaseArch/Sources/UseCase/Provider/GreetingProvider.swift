//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import Foundation

final class GreetingProvider: GreetingProviderType {

    /// Fake provider
    func provideGreetingData() -> GreetingData {
        let person = PersonDTO(firstName: "Foo", lastName: "Bar") // usually comes from data access layer
        let subject = person.firstName + " " + person.lastName
        let greeting = GreetingData(greeting: "Hello", subject: subject)
        return greeting
    }
}
