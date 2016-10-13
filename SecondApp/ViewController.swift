//
//  ViewController.swift
//  SecondApp
//
//  Created by nach plan on 10.10.16.
//  Copyright © 2016 nach plan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var vanish:Bool=true
    @IBOutlet weak var textToPass: UITextField!
    @IBOutlet weak var buttonPassText: UIButton!
    @IBOutlet weak var buttonRed: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.view.backgroundColor != UIColor.white && self.view.backgroundColor != UIColor.red {
            //set backgroundcolor to white at the beginning, as it seems to not have UIColor.white automatically (?)
            self.view.backgroundColor = UIColor.white
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:  Any?) {
        if segue.identifier == "goTo2",
            let svc = segue.destination as? ViewController2     //only true if right side of statement delivers not nil
        {
            svc.toPass = textToPass.text //save text from textfield textToPass to use it in ViewController2
            svc.vanish=vanish //vanish decides whether label on view2 is there
        }
    }

    
    @IBAction func onClick2(_ sender: UIButton) {
        //go to ViewController2 and pass Text (see func prepare)
        performSegue(withIdentifier: "goTo2", sender: nil)
    }
  
    @IBAction func onClickRed(_ sender: UIButton) {
        //change background of view to red (white) if its white (red)
        //change color of button too
        //if background gets white, label "lblvanish" on ViewController2 is hidden, if red it's there
        
        if self.view.backgroundColor == UIColor.white{
            self.view.backgroundColor = UIColor.red
            buttonRed.backgroundColor = UIColor.white
            buttonRed.setTitle("Switch background back to white", for: .normal)
            vanish=false //lblvanish is not hidden
        } else{
            self.view.backgroundColor = UIColor.white
            buttonRed.backgroundColor = UIColor.red
            buttonRed.setTitle("Switch background to red", for: .normal)
            vanish=true //lblvanish is hidden
        }
    }
    
    public func add(_ a: Int,_ b: Int)->Int{
        return a+b
        
    }
}

