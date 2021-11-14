@testable import BaseArch

class TestDouble {}

// Movies
extension TestDouble {
    static var movies: MoviesDTO {
        MoviesDTO(
            page: 1,
            results: [TestDouble.movie, TestDouble.movie],
            total_pages: 1,
            total_results: 2
        )
    }
}

// Movie
extension TestDouble {
    static var movie: MovieDTO {
        MovieDTO(
            adult: false,
            backdrop_path: "backdrop_path",
            genre_ids: [],
            id: Int.random(in: 1...99),
            original_language: "",
            original_title: "",
            overview: "",
            popularity: 0.0,
            poster_path: "",
            release_date: "",
            title: "",
            video: false,
            vote_average: 0.0,
            vote_count: 0
        )
    }
}

// Movie Detail
extension TestDouble {
    static var movieDetail: MovieDetailDTO {
        MovieDetailDTO(
            id: 1,
            title: "title",
            imdb_id: "imdb_id1234",
            poster_path: "poster_path",
            original_title: "original_title",
            overview: "overview"
        )
    }
}
