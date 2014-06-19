//
//  ViewController.swift
//  Traveler
//
//  Created by Crisredfi on 18/06/14.
//  Copyright (c) 2014 crisredfi. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet var travelTableVIew: UITableView
    var objects = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        objects.addObject("one");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return objects.count;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let object = objects[indexPath.row]
        cell.textLabel.text = "test";
        return cell;
    }
       
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        self.performSegueWithIdentifier("detailViewSegue", sender: self);
        
    }

}

