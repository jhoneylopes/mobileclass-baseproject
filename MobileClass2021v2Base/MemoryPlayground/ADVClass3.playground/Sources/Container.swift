import Foundation

public protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

//: A gente pode utilizar os protocols em extensions
//: uma vez Array já implementa as funções de Container fica assim:
extension Array: Container {}

