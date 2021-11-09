//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import XCTest
@testable import BaseArch

class MoviesTests: XCTestCase {

    var sut: MoviesDTO!

    // Um padrão para escrita do nome dos testes:
    // test_<method name>_<precondition>_<expected behavior>
    func test_InitMovie_WhenGivenJson_ReturnsMoviesList() {

        sut = try? CoreTests.load(for: "MoviesTopRatedResponse200")
        XCTAssertTrue(sut.results!.count > 0)
    }
}



