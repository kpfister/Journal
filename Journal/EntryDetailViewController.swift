//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Karl Pfister on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    // MARK: - Outlets and properties
    @IBOutlet weak var titleTextView: UITextField!
    
    @IBOutlet weak var bodyTextField: UITextView!
    
    var entry: Entry?
    
       // MARK: - IBActions
    
    @IBAction func saveButton(sender: AnyObject) {
        
        
        if let entry = entry {
            guard let title = titleTextView.text, bodyText = bodyTextField.text else {
                return
            }
            entry.title = title
            entry.bodyText = bodyText
            self.titleTextView.resignFirstResponder()
            self.bodyTextField.resignFirstResponder()
        } else {
            guard let title = titleTextView.text, bodyText = bodyTextField.text else {
                return
            }
            let entry = Entry(timeStamp: NSDate(), title: title, bodytext: bodyText)
            EntryController.sharedInstance.addEntry(entry)
            self.entry = entry
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func clearButton(sender: AnyObject) {
        titleTextView.text = ""
        bodyTextField.text = ""
    }
    
    
    func updateWithEntry(entry: Entry) {
        self.entry = entry
        self.titleTextView.text = entry.title
        self.bodyTextField.text = entry.bodyText
        
    }
    // MARK: - View controller life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let entry = entry {
            updateWithEntry(entry)
        }
        titleTextView.delegate = self
        bodyTextField.delegate = self
    }
    

}
