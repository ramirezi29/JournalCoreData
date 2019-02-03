//
//  Entry+Convenience.swift
//  JournalCoreData_iOS22
//
//  Created by Ivan Ramirez on 10/10/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    convenience init(title: String, textBody: String, contex: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: contex)
        
        self.title = title
        self.textBody = textBody
    }
}
