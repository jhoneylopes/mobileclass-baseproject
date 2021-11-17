//
//  Copyright © 2017 Jhoney Lopes. All rights reserved.
    

import XCTest

class ClassExampleTests: XCTestCase {

    // Provides an opportunity to customize initial state before a test case begins.
    override class func setUp() {
        super.setUp()
        print("Class setUp")
    }

    // Provides an opportunity to reset state before calling each test method in a test case.
    override func setUp() {
        super.setUp()
        print("func setUp")
    }

    func test_IsZero_WhenValueIsZero_ReturnsTrue() throws {

        let expected = isZero(value: 0)

        XCTAssertEqual(expected, true, "test_IsZero_WhenValueIsZero_ReturnsTrue has been failed")
    }

    func test_IsZero_WhenValueIsNotZero_ReturnsFalse() throws {

        let expected = isZero(value: 99)

        XCTAssertEqual(expected, false, "test_IsZero_WhenValueIsNotZero_ReturnsFalse has been failed")
    }

    func testExampleTwo() {

    }

    private func isZero(value: Int) -> Bool {
        return value == 0
    }
}
