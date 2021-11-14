//
//  Copyright © 2017 Jhoney Lopes. All rights reserved.
    

import XCTest
@testable import BaseArch

class HomeSmokeTests: XCTestCase {

    var sut: MovieService = DependencyManager.resolve(MovieService.self)

    func test_GetMoviesTopRated_WhenPage1_ReturnsListOfMovies() throws {

        self.measure {
            let movieServiceExpect = expectation(description: "MovieService")

            sut.getMoviesTopRated(page: 1) { result in
                switch result {
                case .success(let moviesDTO):
                    XCTAssertTrue(moviesDTO.results!.count > 0)
                case .failure:
                    XCTFail()
                }

                movieServiceExpect.fulfill()
            }

            waitForExpectations(timeout: 3, handler: nil)
        }
    }

    func test_GetMovieByID_WhenID155_ReturnsMovieWithID155() throws {

        self.measure {
            let movieServiceExpect = expectation(description: "MovieService")

            sut.getMovieBy(id: "155") { result in
                switch result {
                case .success(let movieDTO):
                    print(movieDTO)
                    XCTAssertTrue(movieDTO.id == 155)
                case .failure:
                    XCTFail()
                }

                movieServiceExpect.fulfill()
            }

            waitForExpectations(timeout: 3, handler: nil)
        }
    }
}
