//
//  UIButtonViewController.swift
//  Learn
//
//  Created by Avneesh Minocha on 24/10/16.
//  Copyright © 2016 avanish.minocha. All rights reserved.
//

import UIKit

class UIButtonViewController: UIKitViewController {

    let myFirstLabel = UILabel();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "UIButton";
        
        
        myFirstLabel.text = "See here while click on press"
        myFirstLabel.font = UIFont(name: "MarkerFelt-Thin", size: 26)
        myFirstLabel.textColor = UIColor.redColor()
        myFirstLabel.textAlignment = .Center
        myFirstLabel.backgroundColor = UIColor.yellowColor()
        myFirstLabel.frame = CGRectMake(0,0,300,100)
        
        
        
        let myFirstButton = UIButton.init(type: UIButtonType.Custom)
        myFirstButton.setTitle("Press", forState: .Normal)
        myFirstButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        myFirstButton.tintColor = UIColor.cyanColor()
        myFirstButton.frame = CGRectMake(0,CGRectGetMaxY(myFirstLabel.frame),300,40)
        myFirstButton.addTarget(self, action:#selector(UIButtonViewController.pressed(_:)), forControlEvents:.TouchUpInside)
        
        

        self.view.addSubview(myFirstLabel)
        self.view.addSubview(myFirstButton)
        
        myFirstLabel.center = CGPointMake(UIScreen.mainScreen().bounds.width/2,200);
        myFirstButton.center = CGPointMake(UIScreen.mainScreen().bounds.width/2,CGRectGetMaxY(myFirstLabel.frame) + 40);
        
        // Do any additional setup after loading the view.
    }

    func pressed(button:UIButton) -> Void {
        
        myFirstLabel.text =  NSNumber.init(int: rand()).stringValue;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
