//: [Previous](@previous)

import Foundation

//: Non-Generic Version

// Função não genérica utilizada para encontrar um elemento na lista
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

//: Generic Version

// Função genérica utilizada para encontrar um elemento na lista
//func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
//    for (index, value) in array.enumerated() {
//        if value == valueToFind {
//            return index
//        }
//    }
//    return nil
//}
//
//let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
//
//let stringIndex = findIndex(
//    of: "Andrea", in: ["Mike", "Malcolm", "Andrea"]
//)


//: [Next](@next)
