//: [Previous](@previous)

import Foundation

//: ### Quando usar Reference Type
class FooReference {
    var name: String

    init(name: String) {
        self.name = name
    }
}

// Comparar a identidade da instância com === faz sentido
let obj1 = FooReference(name: "Foo1")
let obj1Copy = obj1
let obj2 = FooReference(name: "Foo1")

if obj1 === obj2 {
    print("obj1 === obj2 :: Possuem a mesma referência!")
}

if obj1 === obj1Copy {
    print("obj1 === obj1Copy :: Possuem a mesma referência!")
}

// Você deseja criar um estado mutável e compartilhado
let base = FooReference(name: "Base")
let ref1 = base
let ref2 = base
let ref3 = base
ref3.name = "Ref3"

print(base.name)

//: [Next](@next)
