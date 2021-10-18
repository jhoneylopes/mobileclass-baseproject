//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import XCTest
@testable import BaseArch

class BaseArchTests: XCTestCase {

    var sut: HomeViewController = HomeViewController()

    func test_DidTapButton_UpdateHomeLabel() throws {
        let spy: HomeViewModel = HomeViewModel(
            person: PersonDTO(firstName: "FirstName", lastName: "LastName")
        )

        sut.viewModel = spy
        sut.viewDidLoad()

        sut.showHomeButton.sendActions(for: .touchUpInside)

        XCTAssertTrue(sut.HomeLabel.text == "Hello FirstName LastName")
    }
}
