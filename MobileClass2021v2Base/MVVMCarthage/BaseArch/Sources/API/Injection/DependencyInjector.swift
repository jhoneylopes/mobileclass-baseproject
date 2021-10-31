//  Copyright © 2017 Jhoney Lopes. All rights reserved.

class DependencyInjector {
    static func load() {
        DependencyManager.register(MovieService.self) {
            LiveMovieService()
        }
    }
}
