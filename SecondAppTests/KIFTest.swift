//
//  KIFTest.swift
//  SecondApp
//
//  Created by nach plan on 10.10.16.
//  Copyright © 2016 nach plan. All rights reserved.
//

import XCTest

class KIFTest: KIFTestCase {
    var twoTimes : Bool!
   
    override func setUp() {
        twoTimes=false
    }
    
    func testButtonPassText_ShowsNextScreen_WithText() {
        //goes to next screen with text in the textfield and back
        
        let text = "blabla" //text to be typed from the tester into the text field
        tester().enterText(text, intoViewWithAccessibilityLabel: "textblabla") //enters text in object with accessibilityLabel textblabla (which is our textfield)
        tester().tapView(withAccessibilityLabel: "Copy text on next page") // taps on something with this text on it (checks whether sth with this text exists)
        tester().waitForView(withAccessibilityLabel: text) // checks if correct text appears
        tester().tapView(withAccessibilityLabel: "Back") // goes back (preferably always redo what you've done in a test) (checks whether sth with text "Back" exists)

    }
    
    
    func testViewChangesColor_WhenButtonPressed() {
        //taps button who changes background color
        //tests: background color changes, 1. label on ViewController2 exists or not
        
        let firstView = tester().waitForView(withAccessibilityLabel: "ViewOfViewController") //get current view
        
        if firstView?.backgroundColor == UIColor.white{
            
            //if background is white:
            tester().tapView(withAccessibilityLabel: "Switch background to red") //tap button
            XCTAssertEqual(firstView?.backgroundColor, UIColor.red) //test whether background is red now
            tester().tapView(withAccessibilityLabel: "Copy text on next page") //go to ViewController2
            tester().waitForView(withAccessibilityLabel: "Sometimes I'm here and sometimes not") //red background ->label should exist
            
        } else if firstView?.backgroundColor == UIColor.red{
            
            //if background is red:
            tester().tapView(withAccessibilityLabel: "Switch background back to white") //tap button
            XCTAssertEqual(firstView?.backgroundColor, UIColor.white) //test whether background is white now
            tester().tapView(withAccessibilityLabel: "Copy text on next page") //go to ViewController2
            labelIsNotAvailable(labelText: "Sometimes I'm here and sometimes not") //white background ->label should be hidden
            
        } else{
            
            //if background is not red and not white:
            XCTFail("Color is neither red nor white!?")
            
        }
        
        tester().tapView(withAccessibilityLabel: "Back") //go back to ViewController
        
        if twoTimes==false{
            //make sure that the testfunction is called twice (but not more than twice) to test red and white both
            twoTimes=true
            testViewChangesColor_WhenButtonPressed()
        }
        
    }
    
    func labelIsNotAvailable(labelText: String) {
        //function to test that something with accessibilitylabel "labelText" is not there
        
        do {
            try tester().tryFindingView(withAccessibilityLabel: labelText)
            XCTFail("Should not be found!")
        } catch {
            // Nothing to do here - a throw here is a success.
        }
    }
    
    
}
