//
//  ViewController2.swift
//  SecondApp
//
//  Created by nach plan on 10.10.16.
//  Copyright © 2016 nach plan. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    var toPass:String!
    var vanish:Bool!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblVanish: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if toPass != nil{
            lblResult.text=toPass //copy text from ViewController's textfield
        }
        if vanish == true{
            lblVanish.isHidden=true //change lblVanish to hidden
        }else{
            lblVanish.isHidden=false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
