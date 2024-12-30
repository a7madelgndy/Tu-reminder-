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



