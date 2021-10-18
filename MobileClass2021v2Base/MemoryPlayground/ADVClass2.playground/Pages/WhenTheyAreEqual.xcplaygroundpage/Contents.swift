//: [Previous](@previous)

import Foundation

struct Value: CustomPlaygroundDisplayConvertible {
    let foo: String = "Value Type"

    var playgroundDescription: Any {
        "Value Type"
    }
}

class Reference: CustomPlaygroundDisplayConvertible {
    let foo: String = "Reference Type"

    var playgroundDescription: Any {
        "Reference Type"
    }
}

let valueObj = Value()

let referenceObj = Reference()



//: [Next](@next)
