//
//  ReminderService.swift
//  Tu reminder
//
//  Created by Ahmed El Gndy on 31/12/2024.
//

import Foundation
import CoreData
import UIKit

public class ReminderService {
    
    static var viewContext: NSManagedObjectContext {
        CoreDataProvider.shared.persistentContainer.viewContext
    }
    static func save() throws {
        try viewContext.save()
    }
    //MARK: Save to core Data
    static func saveMyList(name: String , color: UIColor) throws {
        let mylist = MyList(context: viewContext)
        mylist.name = name
        mylist.color = color
        try save()
    }
}
