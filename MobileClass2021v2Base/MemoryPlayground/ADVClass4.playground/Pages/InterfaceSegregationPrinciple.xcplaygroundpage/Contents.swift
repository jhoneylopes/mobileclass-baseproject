//: [Previous](@previous)

import UIKit

///:    I — Interface Segregation
///:    Clientes não deveriam ser forçados a implementar métodos que ele não usam

protocol Mammal {
    func hasHairandFur()
}
protocol Poisonous {
    func hasPoison()
}

class Lion: Mammal {
    func hasHairandFur() {}
}
class Ornithorhynchus: Mammal & Poisonous {
    func hasHairandFur() {}
    func hasPoison() {}
}

//: [Next](@next)
