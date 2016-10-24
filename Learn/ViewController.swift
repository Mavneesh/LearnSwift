//
//  ViewController.swift
//  Learn
//
//  Created by Avneesh Minocha on 24/10/16.
//  Copyright © 2016 avanish.minocha. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var persontableview : UITableView?
    var practicals:NSArray?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Learn";
        
        //register tableviewcell
        persontableview!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        //fetch plist data
        if let path = NSBundle.mainBundle().pathForResource("Practicals", ofType: "plist") {
            practicals = NSArray(contentsOfFile: path)
        }
        
        persontableview?.reloadData();
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return practicals!.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell:UITableViewCell = self.persontableview!.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        let dict = practicals?.objectAtIndex(indexPath.row)
        cell.textLabel?.text = dict!["name"] as? String;
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator;
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        //let pushViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ViewController") as! ViewController;
        
        let dict = practicals?.objectAtIndex(indexPath.row)
        let nibname = dict!["class"] as! String;
        
        switch nibname {
        case "UILabelViewController":
                let pushViewController = UILabelViewController(nibName:nibname, bundle: nil);
                self.navigationController?.pushViewController(pushViewController, animated:true);
        case "UIButtonViewController":
                let pushViewController = UIButtonViewController(nibName:nibname, bundle: nil);
                self.navigationController?.pushViewController(pushViewController, animated:true);
        default:
            assert(false,"Please add viewController as added for UILabelViewController and UIButtonViewController");
        }
    }

}

