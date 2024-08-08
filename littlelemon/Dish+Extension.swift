import Foundation
import CoreData


extension Dish {

    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        for menuItem in menuItems {
            if Dish.exists(title:menuItem.title, in: context) {
                continue
            }
            let dish = Dish(context: context)
            dish.title = menuItem.title
            dish.price = menuItem.price
            dish.dishDescription = menuItem.dishDescription
            dish.category = menuItem.category
            dish.image = menuItem.image
        }
        
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
    
    static func exists(title: String, in context: NSManagedObjectContext) -> Bool {
            let fetchRequest: NSFetchRequest<Dish> = Dish.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "title == %@", title)
            
            do {
                let count = try context.count(for: fetchRequest)
                return count > 0
            } catch {
                print("Failed to fetch count for Dish: \(error)")
                return false
            }
        }
    
}
