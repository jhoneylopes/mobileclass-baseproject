//  Copyright © 2017 Jhoney Lopes. All rights reserved.

final class HomeTestCase: BaseTestCase {

    let  homeRobot = HomeRobot()

    func testShowHomeTable() {
        // When app launch
        homeRobot
            // Then
            .assertHomeTableViewDisplayed()
    }

    func testShowHomeDetailTable() {
        // When app launch
        homeRobot
            // and tap cell
            .tapHomeCell()
            // Then
            .assertHomeDetailViewDisplayed()
    }
}

