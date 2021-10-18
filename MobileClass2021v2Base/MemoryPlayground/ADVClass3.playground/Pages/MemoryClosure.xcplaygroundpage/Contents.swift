//: [Previous](@previous)

import UIKit

final class Class1 {
    var didFinish: ((String) -> Void)?
    var foo: String?

    init(foo: String) {
        self.foo = foo

        bind()
    }

    func bind() {
        didFinish = { _ in
            print("DidFinish \(self.foo)")
        }
    }

    deinit {
        print("deinit Class1")
    }
}

do {
    let memory = Class1(foo: "Foo")

    memory.didFinish?("Bar")
}

//: [Next](@next)
