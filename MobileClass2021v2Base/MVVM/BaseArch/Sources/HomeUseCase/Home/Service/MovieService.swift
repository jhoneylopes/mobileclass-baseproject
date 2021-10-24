import Foundation

protocol MovieService {

    func getMoviesTopRated(page: Int, completion: @escaping (Result<MoviesDTO, APIError>) -> Void)
}

final class LiveMovieService: CoreAPIService, MovieService {
    func getMoviesTopRated(
        page: Int,
        completion: @escaping (Result<MoviesDTO, APIError>) -> Void
    ) {

        let request = makeRequest(
            path: "/3/movie/top_rated",
            httpMethod: HTTPMethod.GET.rawValue,
            query: [URLQueryItem(name: "page", value: "\(page)")]
        )

        perform(request: request, completion: completion)
    }
}

//extension CoreAPIService: MovieService {
//    func getMoviesTopRated(
//        page: Int,
//        completion: @escaping (Result<MoviesDTO, APIError>) -> Void
//    ) {
//
//        let request = makeRequest(
//            path: "/3/movie/top_rated",
//            httpMethod: HTTPMethod.GET.rawValue,
//            query: [URLQueryItem(name: "page", value: "\(page)")]
//        )
//
//        perform(request: request, completion: completion)
//    }
//}
