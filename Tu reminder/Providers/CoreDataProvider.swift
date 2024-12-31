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
    public let persistentContainer: NSPersistentContainer
    private init () {
        //Register TransFormers
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))
        
        persistentContainer = NSPersistentContainer(name: "RemindersModel")
        persistentContainer.loadPersistentStores {
           description , error in
            if let error {
                fatalError("Error initializing REminderModle \(error )")
            }
        
        }
    }
}
