//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import XCTest
@testable import BaseArch

class MoviesDTOTests: XCTestCase {

    var sut: MoviesDTO! // System Under Test

    // Um padrão para escrita do nome dos testes:
    // test_<method name>_<precondition>_<expected behavior>
    func test_InitMovie_WhenGivenJson_ReturnsMoviesList() {

        sut = try? CoreTests.load(for: "MoviesTopRatedResponse200")
        XCTAssertTrue(sut.results!.count > 0)
    }

    func test_Init_WhenIsManual_ReturnsMoviesListIsNotNil() {

        sut = MoviesDTO(page: 0, results: [], total_pages: 0, total_results: 0)
        XCTAssertTrue(sut.page != nil)
        XCTAssertTrue(sut.results != nil)
        XCTAssertTrue(sut.total_pages != nil)
        XCTAssertTrue(sut.total_results != nil)
    }
}
