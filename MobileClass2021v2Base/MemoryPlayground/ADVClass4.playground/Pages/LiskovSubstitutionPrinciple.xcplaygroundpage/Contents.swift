//: [Previous](@previous)

import UIKit

/// L — Liskov Substitution
///     If S is a subtype of T, then objects of type T in a program may be replaced with objects of type S without altering any of the desirable properties of that program. Ele foi definido por Bárbara Liskov sendo a definição matemática original: "Se para cada objeto o1 do tipo S existe um objeto o2 do tipo T, de modo que para todos os programas P definidos em termos de T, o comportamento de P permanece inalterado quando o1 é substituído por o2, então S é um subtipo de T.

// O clássico exemplo das figuras geométricas

// --- INIT
//class Rectangle {
//    var width: Int
//    var height: Int
//
//    init(width: Int, height: Int) {
//        self.width = width
//        self.height = height
//    }
//
//    func area() -> Int {
//        return width * height
//    }
//}
//
//class Square: Rectangle {
//    override var width: Int {
//        didSet {
//            super.height = width
//        }
//    }
//
//    override var height: Int {
//        didSet {
//            super.width = height
//        }
//    }
//}
//
//do {
//    let square = Square(width: 4, height: 4)
//
//    let rectangle: Rectangle = square
//
//    rectangle.height = 2
//    rectangle.width = 4
//
//
//    print(rectangle.area())
//    /// A área deveria ser 2 x 4 = 8, mas nós tivemos 4 x 4 = 16. Por quê?
//}
// --- END

/// Solução para Liskov mais simples seria sempre usar compositions ao invés de heranças
// --- INIT
//protocol Geometrics {
//    func area() -> Int
//}
//
//class Rectangle: Geometrics {
//    var width: Int
//    var height: Int
//
//    init(width: Int, height: Int) {
//        self.width = width
//        self.height = height
//    }
//
//    func area() -> Int {
//        return width * height
//    }
//}
//
//class Square: Geometrics {
//    var edge: Int
//
//    init(edge: Int) {
//        self.edge = edge
//    }
//
//    func area() -> Int {
//        return edge * edge
//    }
//}
//
//do {
//    let rectangle: Geometrics = Rectangle(width: 10, height: 10)
//    print(rectangle.area())
//
//    let rectangle2: Geometrics = Square(edge: 5)
//    print(rectangle2.area())
//}
// --- END

/// Um último cenário para enteder a diferença entre Liskov e OCP

// --- INIT
//class Shape {
//    func doSomething() {
//        // faz algo
//    }
//}
//
//class Square: Shape {
//    func drawSquare() {
//        // desenha um quadrado
//    }
//}
//
//class Circle: Shape {
//    func drawCircle() {
//        // desenha um círculo
//    }
//}
//
//func draw(shape: Shape) {
//    if let square = shape as? Square {
//        square.drawSquare()
//    } else if let circle = shape as? Circle {
//        circle.drawCircle()
//    }
//}
// --- END

//: [Next](@next)
