//
//  XCTestCase.swift
//  MendelugramUITests
//
//  Created by David Aldorf on 29/04/2019.
//

import XCTest

extension XCTestCase {
    
    func waitFor(_ element: XCUIElement, timeout: TimeInterval = 5) {
        
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: timeout, handler: nil)
    }
}
