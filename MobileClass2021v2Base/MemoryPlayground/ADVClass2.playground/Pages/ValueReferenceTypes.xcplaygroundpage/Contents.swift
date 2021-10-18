//: [Previous](@previous)

import Foundation

//: # Value Type e Reference Type

//: Value type example
struct S {
    var data: Int = -1
}
var a = S()
var b = a                        // a é copiado para b
a.data = 42                      // Altera a, porém não b
print("\(a.data), \(b.data)")    // print "42, -1"

//: Reference type example
class C {
    var data: Int = -1
}

var x = C()
var y = x                        // x é copiado para y
x.data = 42                      // Altera a instância referenciada por x e y
print("\(x.data), \(y.data)")    // prints "42, 42"


extension C: CustomPlaygroundDisplayConvertible {
    var playgroundDescription: Any {
        return ""
    }
}

//: [Next](@next)
