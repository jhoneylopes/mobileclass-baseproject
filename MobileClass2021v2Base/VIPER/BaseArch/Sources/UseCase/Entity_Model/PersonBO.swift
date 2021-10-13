//  Copyright © 2017 Jhoney Lopes. All rights reserved.

struct PersonBO {
    let firstName: String
    let lastName: String

    var fullName: String {
        firstName + " " + lastName
    }
}
