///
///: #The XCTest types of particular interest to us are:
///
///: - XCUIApplication: A proxy that can launch, monitor, and terminate an app
///:    -- The app is launched using XCUIApplication
///: - XCUIElementQuery: A query for locating UI elements
///:    -- XCUIElementQuery is used to locate the UI element we wish to test
///: - XCUIElement: A UI element in an app
///:    -- Once we have located the XCUIElement, we can assert that it meets our expectations (e.g simply that it exists, or some property of it matches expectations, etc.)
///

import XCTest

// Page/Identifer
// Action
// Asserts

// MARK: Page
enum HomePage {

    enum Identifiers {
        static let showHomeTable = "HomeTableView"
        static let showHomeDetail = "HomeDetailView"
        static let homeCellTable = "HomeCell_0"
    }

    enum Tables {
        static let showHomeTable = app.tables[Identifiers.showHomeTable]
    }

    enum Cells {
        static let homeCell = app.tables.cells[Identifiers.homeCellTable]
    }

    enum Views {
        static let homeDetail = app.otherElements[Identifiers.showHomeDetail]
    }
}


// MARK: Actions
struct HomeRobot {

    @discardableResult
    func tapHomeCell(file: StaticString = #file, line: UInt = #line) -> Self {
        let cell = HomePage.Cells.homeCell
        XCTAssertTrue(cell.exists, "Cell does not exist", file: file, line: line)
        cell.tap()
        return self
    }
}

// MARK: Asserts
extension HomeRobot {

    @discardableResult
    func assertHomeTableViewDisplayed(file: StaticString = #file, line: UInt = #line) -> Self {
        let table = HomePage.Tables.showHomeTable.waitForExistence(timeout: 5)
        XCTAssertTrue(table, "Home not displayed", file: file, line: line)
        return self
    }

    @discardableResult
    func assertHomeCellTableViewDisplayed(file: StaticString = #file, line: UInt = #line) -> Self {
        let table = HomePage.Cells.homeCell.waitForExistence(timeout: 5)
        XCTAssertTrue(table, "Home cell not displayed", file: file, line: line)
        return self
    }

    @discardableResult
    func assertHomeDetailViewDisplayed(file: StaticString = #file, line: UInt = #line) -> Self {
        let table = HomePage.Views.homeDetail.waitForExistence(timeout: 5)
        XCTAssertTrue(table, "Home detail not displayed", file: file, line: line)
        return self
    }
}

