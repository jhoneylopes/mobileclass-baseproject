//: [Previous](@previous)

import Foundation

// Declaraçãod de uma estrutura de dados Pilha genérica
struct Stack<Element>: CustomStringConvertible {
    var items: [Element] = []

    var description: String {
        "\(items)"
    }

    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

// Extensão da pilha com uma propriedade utilizando o "generic type"
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

do {
    var stackOfStrings = Stack<String>()
    stackOfStrings.push("uno")
    stackOfStrings.push("dos")
    stackOfStrings.push("tres")
    stackOfStrings.push("cuatro")
    // Adiciona 4 itens

    let fromTheTop = stackOfStrings.pop()
    // Remove 1 item


    print(stackOfStrings)
}


//: [Next](@next)
