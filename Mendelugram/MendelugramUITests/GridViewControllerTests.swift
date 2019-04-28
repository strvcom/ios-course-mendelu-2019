//
//  GridViewControllerTests.swift
//  MendelugramUITests
//
//  Created by David Aldorf on 28/04/2019.
//

import XCTest

class GridViewControllerTests: XCTestCase {

    // MARK: - Set Up
    override func setUp() {
        XCUIApplication().launch()
    }

    // MARK: - Test Cases
    func testGridCellsLoaded() {
        
        let app = XCUIApplication()
        app.tabBars.buttons["Grid"].tap()
        let cells = app.collectionViews.cells.element
        
        waitFor(cells)
        
        XCTAssert(cells.exists, "First cell should exists")
        XCTAssertEqual(app.collectionViews.cells.count, 18, "Number of cells should be 18")
    }

}
