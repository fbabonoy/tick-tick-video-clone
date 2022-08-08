//
//  videoPlayerUITests.swift
//  videoPlayerUITests
//
//  Created by fernando babonoyaba on 8/8/22.
//

import XCTest

class videoPlayerUITests: XCTestCase {
    
    func testScrollVideo() throws {
        let application = XCUIApplication()
        application.launch()
        let collectionViewsQuery = XCUIApplication().collectionViews
        collectionViewsQuery.cells.otherElements.containing(.slider, identifier:"1%").element.swipeUp()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["pause"]/*[[".cells.buttons[\"pause\"]",".buttons[\"pause\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                
    
    }


}
