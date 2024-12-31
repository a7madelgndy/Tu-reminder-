//
//  Mylist+CoreDataProperties.swift
//  Tu reminder
//
//  Created by Ahmed El Gndy on 30/12/2024.
//

import Foundation
import CoreData
import UIKit



extension MyList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyList> {
        return NSFetchRequest<MyList>(entityName: "MyList")
    }

    @NSManaged public var color: UIColor
    @NSManaged public var name: String

}
extension MyList:Identifiable {


}
extension MyList {
    @objc(addRemindersObject:)
    @NSManaged public func addToReminders(_ value: Reminder)

    @objc(removeRemindersObject:)
    @NSManaged public func removeFromReminders(_ value: Reminder)

    @objc(addReminders:)
    @NSManaged public func addToReminders(_ values: NSSet)

    @objc(removeReminders:)
    @NSManaged public func removeFromReminders(_ values: NSSet)
}


