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
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
            
            FetchedObjects() { (dishes: [Dish]) in
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
                }
            }
        }.task {
            await dishesModel.reload(viewContext)
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
          return [
              NSSortDescriptor(key: "name", ascending: true,selector: #selector(NSString.localizedCompare(_:))),
              NSSortDescriptor(key: "size", ascending: true,selector: #selector(NSString.localizedCompare(_:)))
          ]
      }
    
}

#Preview {
    Menu()
}
