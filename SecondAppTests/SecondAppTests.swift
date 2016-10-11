//
//  SecondAppTests.swift
//  SecondAppTests
//
//  Created by nach plan on 10.10.16.
//  Copyright © 2016 nach plan. All rights reserved.
//

import XCTest
@testable import SecondApp

class SecondAppTests: XCTestCase {
    
    var vc:ViewController!
    
    override func setUp() {
        super.setUp()
        // This method is called before the invocation of each test method in the class.
        
        //to always have a fresh storyoard for the tests:
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        vc = storyboard.instantiateViewController(withIdentifier: "1") as! ViewController
    }
    
    override func tearDown() {
        // This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAdd() {
        let c = vc.add(1 , 1)
        XCTAssert( c == 2, "\(c)") //gibt den Wert von c als Fehlercode aus, wenn c nicht 2 ist, sonst Test succeeded
    }
    
    
}
