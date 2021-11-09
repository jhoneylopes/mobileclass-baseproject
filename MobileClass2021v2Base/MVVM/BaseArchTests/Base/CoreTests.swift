//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import Foundation

final class CoreTests {

    enum CoreTestsError: Error {
        case decodingError
        case bundleMainPathError
    }

    static func load<T: Decodable>(for resource: String, type: String = "json") throws -> T {
        if let path = Bundle.main.path(forResource: resource, ofType: type) {
            do {
                let decoder = JSONDecoder()
                let data = try Data(
                  contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe
                )
                let decodedData: T = try decoder.decode(T.self, from: data)
                return decodedData
              } catch {
                throw CoreTestsError.decodingError
              }
        }
        throw CoreTestsError.bundleMainPathError
    }
}

