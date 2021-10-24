//: [Previous](@previous)

import Foundation

// private / public / ::internal
// Final / Open
class A {
    fileprivate var foo: String = "Default Value"

    final func showFoo() {
        print(foo)
    }
}

extension A {

    func showFooExtension() {
        print("Show foo " + self.foo)
    }
}

class B: A {
//    override func showFoo() {
//        print("Hello")
//    }
}

let bar = B()
bar.showFoo()
bar.showFooExtension()



//: [Next](@next)
