//
//  Menu.swift
//  littlelemon
//
//  Created by Linval Muchapirei on 7/8/2024.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var dishesModel = DishesModel()
    @State var searchText = ""
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
            NavigationView {
                FetchedObjects(
                    predicate:buildPredicate(searchText: searchText),
                    sortDescriptors:buildSortDescriptors()
                ) { (dishes: [Dish]) in
                    List {
                        ForEach(dishes,id: \.self){ dish in
                            HStack {
                                Text("\(dish.title ?? "") - \(dish.price ?? "")")
                                //                            if let image = dish.image {
                                //                                let url = URLRequest(string:image)
                                //                                AsyncImage(url: url)
                                //                            }
                            }
                        }
                    }.searchable(text: $searchText){
                        
                    }
                }
            }
        }.task {
            await dishesModel.reload(viewContext)
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
          return [
              NSSortDescriptor(key: "title", ascending: true,selector: #selector(NSString.localizedCompare(_:))),
              NSSortDescriptor(key: "price", ascending: true,selector: #selector(NSString.localizedCompare(_:)))
          ]
    }
    
    func buildPredicate(searchText: String) -> NSPredicate {
         if searchText.isEmpty {
             // Return a predicate that always evaluates to true (no filtering)
             return NSPredicate(value: true)
         } else {
             // Build a predicate to filter entries containing searchText in name attribute
             return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
         }
     }
    
}

#Preview {
    Menu()
}
