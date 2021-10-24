//: [Previous](@previous)

import UIKit

final class Class1 {
    var didFinish: ((String) -> Void)?

    init(foo: String) {
        self.foo = foo
        bind()
    }

    var foo: String?

    func bind() {

        didFinish = { [weak self] _ in

            print("🟢 DidFinish \(self?.foo)")
        }
    }

    deinit {
        print("🔴 deinit Class1")
    }
}

do {
    var memory: Class1? = Class1(foo: "Foo")

    memory?.didFinish?("Bar")
}

//: [Next](@next)
