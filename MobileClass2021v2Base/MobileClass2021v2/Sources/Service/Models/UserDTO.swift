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
struct UserDTO: Codable {
    let email: String?
}
