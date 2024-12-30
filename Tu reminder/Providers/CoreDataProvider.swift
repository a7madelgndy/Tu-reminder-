//
//  CoreDataProvider.swift
//  Tu reminder
//
//  Created by Ahmed El Gndy on 30/12/2024.
//

import Foundation
import CoreData

class CoreDataProvider {
    
    static let shared = CoreDataProvider()
    private let persistentContainer: NSPersistentContainer
    private init () {
        persistentContainer = NSPersistentContainer(name: "ReminderModel")
        persistentContainer.loadPersistentStores {
           description , error in
            if let error {
                fatalError("Error initializing REminderModle \(error )")
            }
        
        }
    }
}
