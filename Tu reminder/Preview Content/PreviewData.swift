//
//  PreviewData.swift
//  Tu reminder
//
//  Created by Ahmed El Gndy on 31/12/2024.
//

import Foundation

import CoreData

class PreviewData {
    
    static var myList : MyList {
        let viewContext = CoreDataProvider.shared.persistentContainer.viewContext
        
        let request = MyList.fetchRequest()
        
        return (try? viewContext.fetch(request).first) ?? MyList()
    }
    
}
