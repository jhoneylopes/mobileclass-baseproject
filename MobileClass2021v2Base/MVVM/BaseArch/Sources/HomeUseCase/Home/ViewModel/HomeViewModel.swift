//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    var homeDetailsIdentifier: String { get }
    var didTapCell: ((_ identifier: String, _ index: Int) -> Void)? { get set }
    var didFinishGetTopRatedMovies: ((MoviesDTO) -> Void)? { get set }
    var api: MovieService { get set }

    init(api: MovieService)

    func goToHomeDetails(movieID: Int)
    func didGetMovies()
}

class HomeViewModel: HomeViewModelProtocol {
    var api: MovieService

    required init(api: MovieService) {
        self.api = api
    }

    var homeDetailsIdentifier = "HomeDetailViewController"

    var didTapCell: ((String, Int) -> Void)?
    var didFinishGetTopRatedMovies: ((MoviesDTO) -> Void)?

    func goToHomeDetails(movieID index: Int) {        
        didTapCell?(homeDetailsIdentifier, index)
    }

    func didGetMovies() {

        api.getMoviesTopRated(page: 1) { [weak self] result in
            switch result {
            case .success(let data):
                self?.didFinishGetTopRatedMovies?(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
