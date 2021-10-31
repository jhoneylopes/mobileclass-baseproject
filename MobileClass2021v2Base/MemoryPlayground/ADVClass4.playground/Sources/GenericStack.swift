import Foundation

// Declaração de uma Stack genérica com o protocolo Container
public struct Stack<Element>: Container {
    // Implementação original de Stack genérica
    public var items: [Element] = []

    public init() {}

    public mutating func push(_ item: Element) {
        items.append(item)
    }
    
    public mutating func pop() -> Element {
        return items.removeLast()
    }
    
    // Conformando com o protocolo container
    public mutating func append(_ item: Element) {
        self.push(item)
    }
    public var count: Int {
        return items.count
    }
    public subscript(i: Int) -> Element {
        return items[i]
    }
}
