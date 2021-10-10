//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import XCTest

class BaseArchUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }
}
