//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import XCTest
@testable import BaseArch

class BaseArchTests: XCTestCase {

    var sut: GreetingViewController = GreetingViewController()

    func test_DidTapButton_UpdateGreetingLabel() throws {
        let spy: GreetingViewModel = GreetingViewModel(
            person: PersonDTO(firstName: "FirstName", lastName: "LastName")
        )

        sut.viewModel = spy
        sut.viewDidLoad()

        sut.showGreetingButton.sendActions(for: .touchUpInside)

        XCTAssertTrue(sut.greetingLabel.text == "Hello FirstName LastName")
    }
}
