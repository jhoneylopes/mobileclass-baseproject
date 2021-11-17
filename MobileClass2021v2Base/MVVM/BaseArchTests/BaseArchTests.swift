//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import XCTest
@testable import BaseArch

class BaseArchTests: XCTestCase { // Fazemos a nossa classe sub-classe de XCTestCase

    /// Fornece uma oportunidade de customizar o estado inicial antes que a classe teste inicie.
    override class func setUp() {
        super.setUp()
    }

    /// Fornece uma oportunidade para resetar o estado antes de cada teste ser chamado no test.
    override func setUp() {
        super.setUp()
    }

    /// Qualquer teste precisa iniciar com a palavra `test` e seguir com qualquer padrão `_xtp()`
    /// O que será testado _NumberOfVowels
    /// Qual o fluxo _WhenPassedFooBar
    /// Retorno/Saída _ReturnsThree
    func test_NumberOfVowels_WhenPassedFooBar_ReturnsThree() {
        let string = "Foo Bar"
        let numberOfVowels = TestBase.numberOfVowels(in: string)

        XCTAssertEqual(numberOfVowels, 3, "Deveria achar 3 vogais em Foo Bar")
    }

    // To refactor!
    func test_NumberOfVowels_WhenPassedFOO_ReturnsTwo() {
        let string = "FO😀O"
        let numberOfVowels = TestBase.numberOfVowels(in: string)

        XCTAssertEqual(numberOfVowels, 2, "Deveria achar 2 vogais em FOO")
    }

    func test_NumberOfVowels_WhenPassedAllVowels_Returns10() {
        let string = "aeiouAEIOU"
        let numberOfVowels = TestBase.numberOfVowels(in: string)

        XCTAssertEqual(numberOfVowels, 10, "Deveria achar 2 vogais em FOO")
    }
}

// Exemplo de uma Classe e TestCase.
final class TestBase {
    // Red
//    static func numberOfVowels(in string: String) -> Int {
//        return 0
//    }

    // Green
//    static func numberOfVowels(in string: String) -> Int { // O(n^2) BigO - Complexidade de Algoritmo
//        let a: [Character] = ["a", "e", "i", "o", "u"]
//
//        var count = 0
//        for char in string { // O(n)
//            if a.contains(char) { // O(n)
//                count += 1
//            }
//        }
//        return count
//    }

    // Refactor
    static func numberOfVowels(in string: String) -> Int { // O(n)
        var vowels: [Character: Int] = [
            "a": 0, "e": 0, "i": 0, "o": 0, "u": 0,
            "A": 0, "E": 0, "I": 0, "O": 0, "U": 0
        ]

        var numOfVowels = 0

        for char in string { // O(n)
            vowels[char]! += 1
        }

        for item in vowels { // O(n)
            numOfVowels += item.value
        }

//        for char in string {
//            if vowels.contains(char) {
//                numOfVowels += 1
//            }
//        }
        return numOfVowels
    }
}
