//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Karl Pfister on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    
    @IBOutlet weak var titleTextView: UITextField!
    
    @IBOutlet weak var bodyTextField: UITextView!
    
    
    @IBAction func saveButton(sender: AnyObject) {
        
        if let entry = self.entry {
            entry.title = self.titleTextView.text!
            entry.bodyText = self.bodyTextField.text
            entry.timeStamp = NSDate()
        } else {
            let newEntry = Entry(timeStamp: NSDate(), title: self.titleTextView.text!, bodytext: self.bodyTextField.text)
            EntryController.sharedInstance.addEntry(newEntry)
            self.entry = newEntry
        }
        
        self.navigationController?.popViewControllerAnimated(true)
        self.bodyTextField.resignFirstResponder()
        self.titleTextView.resignFirstResponder()
    }
        
//        self.bodyTextField.resignFirstResponder()
//        self.titleTextView.resignFirstResponder()
//    }
    
    
    @IBAction func clearButton(sender: AnyObject) {
        titleTextView.text = ""
        bodyTextField.text = ""
    }
    
    
    var entry: Entry?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        if let entry = entry {
            updateWithEntry(entry)
        }
        titleTextView.delegate = self
        bodyTextField.delegate = self
    }
    
    
    func updateWithEntry(entry: Entry) {
        self.entry = entry
        self.titleTextView.text = entry.title
        self.bodyTextField.text = entry.bodyText
        
    }
        // Do any additional setup after loading the view.
    

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
