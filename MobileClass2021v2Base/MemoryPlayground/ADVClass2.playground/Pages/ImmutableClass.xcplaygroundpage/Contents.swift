//: [Previous](@previous)

import Foundation

final class ImmutableClass: CustomPlaygroundDisplayConvertible {
    let foo: String
    let bar: String

    init(foo: String, bar: String) {
        self.foo = foo
        self.bar = bar
    }

    var playgroundDescription: Any {
        return "This is immutable properties \(self.foo) and \(self.bar)."
    }
}

let a = ImmutableClass(foo: "A", bar: "B")


//: [Next](@next)
