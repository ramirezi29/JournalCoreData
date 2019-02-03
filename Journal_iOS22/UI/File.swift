//
//  File.swift
//  JournalCoreData_iOS22
//
//  Created by Ivan Ramirez on 2/2/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import Foundation
// MARK: - KEYBOARD


//Listening for certain events related to the keyboard
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)


//Stop listening for certain events reltated to the keybaord such as hide/show
//    deinit {
//
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//    }

// MARK: - KEYBOARD ACTIONS

//    @objc func keyboardWillShow(notification: Notification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height / 1.8
//            }
//        }
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y != 0 {
//                self.view.frame.origin.y += keyboardSize.height / 1.8
//            }
//        }
//        if self.view.frame.origin.y != 0 {
//            self.view.frame.origin.y = 0
//
//        }
//    }
    
