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
    func test_NumberOfVowels_WhenPassedFooBar_ReturnsThree() {
        let string = "Foo Bar"
        let numberOfVowels = TestBase.numberOfVowels(in: string)

        XCTAssertEqual(numberOfVowels, 3, "Deveria achar 3 vogais em Foo Bar")
    }
}

// Exemplo de uma Classe e TestCase.
final class TestBase {
    // Red
    static func numberOfVowels(in string: String) -> Int {
        return 0
    }

    // Green
//    static func numberOfVowels(in string: String) -> Int { // O(n^2)
//        let a: [Character] = ["a", "e", "i", "o", "u"]
//
//        var count = 0
//        for char in string {
//            if a.contains(char) {
//                count += 1
//            }
//        }
//        return count
//    }

    // Refactor
//    static func numberOfVowels(in string: String) -> Int {
//        let vowels: [Character] = [
//            "a", "e", "i", "o", "u",
//            "A", "E", "I", "O", "U"
//        ]
//
//        var numOfVowels = 0
//        for char in string {
//            if vowels.contains(char) {
//                numOfVowels += 1
//            }
//        }
//        return numOfVowels
//    }
}
