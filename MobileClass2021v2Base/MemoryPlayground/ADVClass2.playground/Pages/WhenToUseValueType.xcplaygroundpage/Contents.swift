//: [Previous](@previous)

import Foundation

//: ### Quando usar Value Type?
struct FooValue: Equatable {
    var name: String
}

// Comparar dados de instância com == faz sentido
let obj1 = FooValue(name: "Casa")
let obj2 = FooValue(name: "Casa")
if obj1 == obj2 {
    print("São iguais!")
}

// Você quer que as cópias tenham um estado independente
let mainObj = FooValue(name: "Bar")
let copyObj = mainObj

//Os dados serão usados no código em vários threads
do {
    var asyncObj = FooValue(name: "Name")
    DispatchQueue(label: "Queue1", qos: .utility).async {
        var queueObj = asyncObj
        queueObj.name = "Queue1"
        print(asyncObj)
    }

    DispatchQueue(label: "Queue2", qos: .utility).async {
        var queueObj = asyncObj
        queueObj.name = "Queue2"
        print(asyncObj)
    }

    print(asyncObj)
}

//: [Next](@next)
