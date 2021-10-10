//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import XCTest
@testable import BaseArch

class BaseArchTests: XCTestCase {

    var sut: GreetingViewController = GreetingViewController()

    func test_DidTapButton_UpdateGreetingLabel() throws {
        sut.person = PersonDTO(firstName: "FirstName", lastName: "LastName")

        sut.viewDidLoad()

        sut.showGreetingButton.sendActions(for: .touchUpInside)

        XCTAssertTrue(sut.greetingLabel.text == "Hello FirstName LastName")
    }
}
