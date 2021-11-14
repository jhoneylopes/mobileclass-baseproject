//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import XCTest
import Alamofire
@testable import BaseArch

class HomeServiceTests: XCTestCase {

    var sut: MovieService!

    override class func setUp() {
        super.setUp()
        DependencyManager.clean()
        DependencyManager.register(MovieService.self) {
            FakeMovieService()
        }
    }

    func test_GetMoviesTopRated_WhenPage1_ReturnsListOfMovies() throws {

        self.measure {
            sut = DependencyManager.resolve(MovieService.self)

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
            sut = DependencyManager.resolve(MovieService.self)
            
            let movieServiceExpect = expectation(description: "MovieService")

            sut.getMovieBy(id: "155") { result in
                switch result {
                case .success(let movieDTO):                    
                    XCTAssertTrue(movieDTO.id != 0)
                case .failure:
                    XCTFail()
                }

                movieServiceExpect.fulfill()
            }

            waitForExpectations(timeout: 3, handler: nil)
        }
    }

}

private final class FakeMovieService: MovieService {
    func getMoviesTopRated(page: Int, completion: @escaping (Result<MoviesDTO, APIError>) -> Void) {
        completion(.success(TestDouble.movies))
    }

    func getMovieBy(id: String, completion: @escaping (Result<MovieDetailDTO, AFError>) -> Void) {
        completion(.success(TestDouble.movieDetail))
    }

    func downloadImage(imagePath: String, completion: @escaping (Result<URL, AFError>) -> Void) {
        completion(Result.success(URL(string: "www.test.com")!))
    }
}
