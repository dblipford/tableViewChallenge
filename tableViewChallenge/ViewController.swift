//
//  ViewController.swift
//  tableViewChallenge
//
//  Created by Derion B. Lipford on 4/13/16.
//  Copyright © 2016 Derion B. Lipford. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //initialize alert
    let alertController = UIAlertController(title: "Table View", message:
        "You seleected a step.", preferredStyle: UIAlertControllerStyle.Alert);
    
    
    //
    //MARK: properties
    //
    
    //******************************************************************************************
    // MODEL DATA
    //
    //Because the table is not editable, I've made the following immutable
    //
    let arrayOfThings = ["1. Hook up datasource", "2. Hook up delegate", "3. Conform to protocols",
        "4. Implement required methods", "   4.1 numberOfSectionsInTableView", "   4.2 numberOfRowsInSection",
        "   4.3 cellForRowAtIndexPath", "5. Implement Additional Methods", "   5.1 didSelectRowAtIndexPath"]
    //
    // I've used spaces in the strings to give the impression of indentation
    //
    //******************************************************************************************
    
    
    //
    //MARK: inherited / overridden methods
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Add Dismiss button to alert
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //REQUIRED//
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfThings.count
    }
    
    
    //REQUIRED//
    //Generate Cells for TableView - Return a UITableViewCell (table row) - I will use a stock item, but typically you would make your own
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //Construct a cell (not the most efficient method)
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        //See here how Optional Chaining is used to conditionally set a property if it is not nil
        cell.textLabel?.text = self.arrayOfThings[indexPath.row]
        return cell
    }
    
    //Call back when a user taps on a row in a given section.
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //We only have one section, so use indexPath.row to dereference the array
        let selectedString = self.arrayOfThings[indexPath.row]
            self.presentViewController(alertController, animated: true, completion: nil)
        
        
        //Animate the deselection
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
}


