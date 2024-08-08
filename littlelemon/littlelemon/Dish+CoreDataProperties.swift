//
//  Dish+CoreDataProperties.swift
//  littlelemon
//
//  Created by Linval Muchapirei on 8/8/2024.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var title: String?
    @NSManaged public var price: String?

}

extension Dish : Identifiable {

}
