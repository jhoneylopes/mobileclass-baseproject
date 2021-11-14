//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import XCTest
@testable import BaseArch

class HomeViewControllerTests: XCTestCase {

    var sut: HomeViewController!

    override func setUp() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            identifier: "HomeViewController"
        )
        sut = viewController as? HomeViewController
    }


    func test_TableView_AfterViewDidLoad_IsNotNil() {
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView)
    }

    func test_LoadingView_SetsTableViewDataSource() {
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView.dataSource is HomeViewController)
    }

    func test_NumberOfRows_InFirstSection_ReturnsThree() {
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 3)
    }


}
