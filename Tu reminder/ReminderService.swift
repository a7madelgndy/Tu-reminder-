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
    //MARK: Save  list
    static func saveMyList(name: String , color: UIColor) throws {
        let mylist = MyList(context: viewContext)
        mylist.name = name
        mylist.color = color
        try save()
    }
    //MARK: Save  Reminder
    static func saveReminderToMylist(list : MyList ,ReminderTitle : String ) throws {
        let reminder = Reminder(context: viewContext)
        reminder.title = ReminderTitle
        list.addToReminders(reminder)
    }
    
    //MARK: Reminder connected to a specific  list
    
    static func getRemindersBylist(mylist: MyList)-> NSFetchRequest<Reminder> {
        let request = Reminder.fetchRequest()
        request.sortDescriptors = []
        request.predicate = NSPredicate(format: "list = %@ AND isCompleted = false" , mylist
        )
        print(request)
        return request
    }
}
