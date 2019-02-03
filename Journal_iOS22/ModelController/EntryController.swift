//
//  EntryController.swift
//  Journal_iOS22
//
//  Created by Ivan Ramirez on 10/3/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    //Shared Instance
    static let shared = EntryController()
    
    //used for the search bar in order to fetch the data
    var predicate: NSPredicate?
    
    // Source of Truth
    var entries: [Entry] {
        // our array of entries to return by. asking MOC. need Fetch Request. Allow you to ask for data from CoreData and can even specifiy critieria
        
        let request: NSFetchRequest<Entry> = Entry.fetchRequest()
        request.predicate = predicate
        // how to tell CoreData you want those items
        do {
            return try CoreDataStack.context.fetch(request)
            //now an array of of entries will be returned
        } catch {
            print("Error fetching entries: \(error)")
            // return an emtpy array bc it needs to return something even if it doesnt work
            return []
        }
    }
    
    //create
    func add(entry: Entry) {
        saveToPersistentStorage()
    }
    
    //Delete
    func remove(entry: Entry) {
        //optional
        if  let moc = entry.managedObjectContext {
            moc.delete(entry)
            saveToPersistentStorage()
        }
    }
    
    //Update
    func update(entry: Entry, title: String, textBody: String) {
        entry.title = title
        entry.textBody = textBody
        saveToPersistentStorage()
    }
    
    // MARK: - Persistence
    
    //2. Save to CoreData
    func saveToPersistentStorage() {
        
        do {
            try CoreDataStack.context.save()
            
        } catch let error {
            print("🚀 There was an error in \(#function); \(error); \(error.localizedDescription) 🚀")
        }
    }
}
