//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import XCTest
@testable import BaseArch

class BaseArchTests: XCTestCase {

    var sut: GreetingViewController = GreetingViewController()
    let spyPresenter = GreetingPresenter()
    let spyInteractor = GreetingInteractor()

    func test_DidTapButton_UpdateGreetingLabel() throws {
        sut.eventHandler = spyPresenter
        spyPresenter.view = sut

        spyPresenter.greetingInteractor = spyInteractor
        spyInteractor.output = spyPresenter

        sut.viewDidLoad()

        sut.showGreetingButton.sendActions(for: .touchUpInside)

        XCTAssertTrue(sut.greetingLabel.text == "Hello FirstName LastName")
    }
}
