//  Copyright © 2017 Jhoney Lopes. All rights reserved.
    
import XCTest

let app = XCUIApplication()

class BaseTestCase: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
}
