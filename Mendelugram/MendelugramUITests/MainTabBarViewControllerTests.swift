//
//  MainTabBarViewControllerTests.swift
//  MendelugramUITests
//
//  Created by David Aldorf on 29/04/2019.
//

import XCTest

class MainTabBarViewControllerTests: XCTestCase {

    // MARK: - Constants
    struct Constants {
        static let gridTabBarTitle = "Grid"
        static let feedTabBarTitle = "Feed"
    }
    
    // MARK: - Set Up
    override func setUp() {
        XCUIApplication().launch()
    }
    
    // MARK: - Test Cases
    func testTabBarButtons() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        
        let gridTabBarButton = tabBarsQuery.buttons[Constants.gridTabBarTitle]
        let feedTabBarButton = tabBarsQuery.buttons[Constants.feedTabBarTitle]
        
        XCTAssert(gridTabBarButton.exists, "Grid Tab Bar Item should exist")
        XCTAssert(feedTabBarButton.exists, "Feed Tab Bar Item should exist")
    }

}
