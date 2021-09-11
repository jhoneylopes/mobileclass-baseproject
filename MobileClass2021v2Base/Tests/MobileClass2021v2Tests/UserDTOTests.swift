import XCTest
@testable import MobileClass2021v2

class UserDTOTests: XCTestCase {

    func test_init_whenJSONHasData_ReturnsSuccess() {
        let data = FileAccess.loadFile(from: "UserResponse200") ?? Data()
        let userObj = try? JSONDecoder().decode(UserDTO.self, from: data)

        XCTAssertTrue(userObj?.email != "")
    }

    func test_equal_whenObj1IsEqualObj2_ReturnsSuccess() {        
//        let data = FileAccess.loadFile(from: "UserResponse200") ?? Data()
//        let userObj1 = try? JSONDecoder().decode(UserDTO.self, from: data)
//        let userObj2 = try? JSONDecoder().decode(UserDTO.self, from: data)
//
//        XCTAssertTrue(userObj1 == userObj2)
    }
}

class FileAccess {
    static func loadFile(from name: String) -> Data? {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                fatalError("loadFile fails")
            }
        }
        return nil
    }
}
