//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import XCTest
@testable import BaseArch

class BaseArchTests: XCTestCase {

    var sut: GreetingViewController = GreetingViewController()
    let mockPresenter = GreetingPresenter()
    let mockInteractor = GreetingInteractor()

    func test_DidTapButton_UpdateGreetingLabel() throws {
        sut.eventHandler = mockPresenter
        mockPresenter.view = sut
        mockPresenter.greetingInteractor = mockInteractor
        mockInteractor.output = mockPresenter

        sut.viewDidLoad()

        sut.showGreetingButton.sendActions(for: .touchUpInside)

        XCTAssertTrue(sut.greetingLabel.text == "Hello FirstName LastName")
    }
}
