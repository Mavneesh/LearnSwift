//
//  UILabelViewController.swift
//  Learn
//
//  Created by Avneesh Minocha on 24/10/16.
//  Copyright © 2016 avanish.minocha. All rights reserved.
//

import UIKit

class UILabelViewController: UIKitViewController {

    var label:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "UILabel";
        // Do any additional setup after loading the view.
        
        
        //Sample text
        self.addLabel(100.0);
        self.setText("set simple text");
        

        
        //Sample attributed Text
        self.addLabel(130.0);
        let yourAttributes = [NSForegroundColorAttributeName: UIColor.blackColor(), NSFontAttributeName: UIFont.systemFontOfSize(15)]
        let yourOtherAttributes = [NSForegroundColorAttributeName: UIColor.redColor(), NSFontAttributeName: UIFont.systemFontOfSize(25)]
        
        let partOne = NSMutableAttributedString(string: "This is an example ", attributes: yourAttributes)
        let partTwo = NSMutableAttributedString(string: " for the combination of Attributed String!", attributes: yourOtherAttributes)
        
        let combination = NSMutableAttributedString()
        
        combination.appendAttributedString(partOne)
        combination.appendAttributedString(partTwo)
        
        self.setAttributedText(combination);

        
        
        
        /*
         Attributes
         var text: String?
         
         The text displayed by the label.
         var attributedText: NSAttributedString?
         
         The styled text displayed by the label.
         var font: UIFont!
         
         The font of the text.
         var textColor: UIColor!
         
         The color of the text.
         var textAlignment: NSTextAlignment
         
         The technique to use for aligning the text.
         var lineBreakMode: NSLineBreakMode
         
         The technique to use for wrapping and truncating the label’s text.
         var isEnabled: Bool
         
         The enabled state to use when drawing the label’s text.
 */
    }

    func addLabel(y:CGFloat) -> Void {
        
        let newframe : CGRect = CGRectMake(0,y,320,20)
        self.label = UILabel(frame: newframe)
        self.label!.center = CGPointMake(UIScreen.mainScreen().bounds.width/2,y)
        self.label!.autoresizingMask = [.FlexibleRightMargin, .FlexibleLeftMargin]
        self.label?.textAlignment = NSTextAlignment.Center;
        self.label?.backgroundColor = UIColor.clearColor();
        self.view.addSubview(self.label!)
    }

    func setText(text:String) -> Void {
        
        label?.text = text;
    }
    
    func setAttributedText(text:NSAttributedString) -> Void {
        
        label?.attributedText = text;
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    override func viewDidAppear(animated: Bool) {
        
        for labels in self.view.subviews as! [UILabel] {
            labels.center.x = UIScreen.mainScreen().bounds.width/2;
        }

    }
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        
        for labels in self.view.subviews as! [UILabel] {
            labels.center.x = UIScreen.mainScreen().bounds.width/2;
        }
        
        
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
