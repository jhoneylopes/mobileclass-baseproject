//: [Previous](@previous)

import Foundation

//: # Qual problema Generics resolve?

//: Construção de declaração não genérica

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var strA = "A"
var strB = "B"
swapTwoStrings(&strA, &strB)
print("strA \(strA) || strB \(strB)")

var double1 = 1.1
var double2 = 2.2
swapTwoDoubles(&double1, &double2)
print("double1 \(double1) || double2 \(double2)")


//: Construção de declaração genérica

//func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}

//var someInt = 3
//var anotherInt = 107
//swapTwoValues(&someInt, &anotherInt)
//// someInt is now 107, and anotherInt is now 3
//
//var someString = "hello"
//var anotherString = "world"
//swapTwoValues(&someString, &anotherString)
//// someString is now "world", and anotherString is now "hello"

//: [Next](@next)
