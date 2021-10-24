//: [Previous](@previous)

import Foundation

//: Non-generic version

// Container protocol declarado no Source

// Declaração de uma Stack que aceita apena Int
struct IntStack: Container {
    // Implementação original do IntStack
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }

    // Conformando com o protocolo Container
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

//: Generic version

// --> Ver GenericStack.swift file


//: Adicionando Type Constraints a um "Associated Type"

/* // Exemplo:
 protocol Container {
     associatedtype Item: Equatable
     mutating func append(_ item: Item)
     var count: Int { get }
     subscript(i: Int) -> Item { get }
 }
 */

//: Conseguimos usar o Associated Type com protocolo e type constraint

protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

// Desse modo só fazer a extension implementar o protocolo
extension Stack: SuffixableContainer {
    func suffix(_ size: Int) -> Stack {
        var result = Stack()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
    // Inferred that Suffix is Stack.
}

var stackOfInts = Stack<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)
let suffix = stackOfInts.suffix(2)
print(suffix)

//: [Next](@next)
