
@testable import BaseArch

class FakeDependencyInjector {
    static func load() {
        DependencyManager.register(MovieService.self) {
            LiveMovieService()
        }
    }
}
