//
//  EntryDetailViewController.swift
//  Journal_iOS22
//
//  Created by Ivan Ramirez on 10/3/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textBodyTextField: UITextView!
    
    //Landing pad
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        
        updateViews()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty, let textBody = textBodyTextField.text else { return }
        if let entry = self.entry {
            EntryController.shared.update(entry: entry, title: title, textBody: textBody)
        } else {
            let entry = Entry(title: title, textBody: textBody)
            EntryController.shared.add(entry: entry)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        textBodyTextField.text = entry?.textBody
        titleTextField.text = entry?.title
    }
}

extension EntryDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(" 🎒 Return Button Tapped, on Title Field" )
        guard let titleName = titleTextField.text,
            !titleName.isEmpty
            else {return false}
        titleTextField.resignFirstResponder()
        return true
    }
}
