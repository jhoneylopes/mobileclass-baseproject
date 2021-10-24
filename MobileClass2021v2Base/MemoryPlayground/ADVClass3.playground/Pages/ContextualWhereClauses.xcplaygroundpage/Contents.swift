//: [Previous](@previous)

import Foundation

extension Container {
    func average() -> Double where Item == Int {
        var sum = 0.0
        for index in 0..<count {
            sum += Double(self[index])
        }
        return sum / Double(count)
    }
    func endsWith(_ item: Item) -> Bool where Item: Equatable {
        return count >= 1 && self[count-1] == item
    }
}

//: Mesma coisa do item anterior só que o contexto na declaração da extension

//extension Container where Item == Int {
//    func average() -> Double {
//        var sum = 0.0
//        for index in 0..<count {
//            sum += Double(self[index])
//        }
//        return sum / Double(count)
//    }
//}
//extension Container where Item: Equatable {
//    func endsWith(_ item: Item) -> Bool {
//        return count >= 1 && self[count-1] == item
//    }
//}

let numbers = [1260, 1200, 98, 37]
print(numbers.average())
// Prints "648.75"
print(numbers.endsWith(37))
// Prints "true"

//: [Next](@next)
