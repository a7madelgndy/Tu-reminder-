//
//  PreviewData.swift
//  Tu reminder
//
//  Created by Ahmed El Gndy on 31/12/2024.
//

import Foundation

import CoreData

class PreviewData {
    
    static var reminder : Reminder {
        let viewContext = CoreDataProvider.shared.persistentContainer.viewContext
        
        let request = Reminder.fetchRequest()
        return (try? viewContext.fetch(request).last) ?? Reminder(context: viewContext)
    }
    
    static var myList : MyList {
        let viewContext = CoreDataProvider.shared.persistentContainer.viewContext
        
        let request = MyList.fetchRequest()
        return (try? viewContext.fetch(request).last) ?? MyList()
    }
    
}
