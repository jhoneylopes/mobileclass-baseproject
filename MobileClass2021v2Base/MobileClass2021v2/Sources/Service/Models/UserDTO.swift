import Foundation

/*
 // TODO: Remove this after class
 {
     "id": "1234",
     "email": "foo@bar.com",
     "fname": "John",
     "lname": "Doe",
     "username": "john.doe",
     "signedup": "true",
     "address": {
         "street": "ALD",
         "city": "BH"
     }
 }
 */

// Decodable && Encodable
struct UserDTO: Decodable {
    let id: String?
    let email: String?
    let signedup: String?
    let address: Address
}

struct Address: Decodable {
    let street: String
    let city: String
}
