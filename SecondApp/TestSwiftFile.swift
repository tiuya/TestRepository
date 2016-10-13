//
//  TestSwiftFile.swift
//  SecondApp
//
//  Created by nach plan on 13.10.16.
//  Copyright © 2016 nach plan. All rights reserved.
//

import Foundation

@objc class TestSwift: NSObject{
    //Memo an mich: In anderem SwiftFile verwendbar mit :
    //let instanceofTestSwift = TestSwift()
    //instanceofTestSwift.minus(a,b)
    func minus(_ a: Int,_ b: Int)->Int{
        return a-b
    }
}
