//
//  FeedViewControllerTests.swift
//  MendelugramUITests
//
//  Created by David Aldorf on 28/04/2019.
//

import XCTest
@testable import Mendelugram

class FeedViewControllerTests: XCTestCase {
    
    // MARK: - Set Up
    override func setUp() {
        XCUIApplication().launch()
    }
    
    // MARK: - Test Cases
    func testFeedTableViewData() {
        
        let app = XCUIApplication()
        let cells = app.tables.cells.element
        
        waitFor(cells)
        
        XCTAssert(cells.exists, "Cells should exists")
        
    }
}
