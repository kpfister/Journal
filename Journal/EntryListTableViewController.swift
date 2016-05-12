//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Karl Pfister on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.sharedInstance.entries.count ?? 0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
        let entry = EntryController.sharedInstance.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            let entry = EntryController.sharedInstance.entries[indexPath.row]
            
            EntryController.sharedInstance.removeEntry(entry)
            
            
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toDetailView" {
            if let entryDetailViewController = segue.destinationViewController as? EntryDetailViewController {
                if let entryCell = sender as? UITableViewCell {
                    if let indexPath = tableView.indexPathForCell(entryCell) {
                        let entry = EntryController.sharedInstance.entries[indexPath.row]
                        entryDetailViewController.entry = entry
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
}




//let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
//    let entry = EntryController.sharedInstance.entries[selectedIndex]
//    entryDetailViewController.entry = entry




//override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//
//    if segue.identifier == "toPlanetDetail" {
//        if let detailViewController = segue.destinationViewController as? PlanetDetailViewController,
//            let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
//
//            let planet = PlanetController.planets[selectedIndex]
//            detailViewController.planet = planet
//        }
//}
//




