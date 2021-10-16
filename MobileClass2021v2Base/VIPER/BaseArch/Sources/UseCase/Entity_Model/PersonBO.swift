//  Copyright © 2017 Jhoney Lopes. All rights reserved.

struct PersonBO { // Entity (usually more complex e.g. NSManagedObject)
    let firstName: String
    let lastName: String

    var fullName: String {
        firstName + " " + lastName
    }
}
