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
    @State var startersIsEnabled = true
    @State var mainsIsEnabled = false
    @State var dessertsIsEnabled = false
    @State var drinksIsEnabled = false
    @State var isKeyboardVisible = false
    var body: some View {
        VStack {
            HeaderView()
            VStack {
                if !isKeyboardVisible {
                    Hero(
                    )
                    .padding()
                    .background(Color.primaryColor)
                    .frame(maxWidth: .infinity, maxHeight: 250)
                }
                TextField("Search", text: $searchText)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .padding([.horizontal, .top])
                                .searchable(text: $searchText)
            }
               

            Text("ORDER FOR DELIVERY!")
                .font(.sectionTitle())
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                .padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    Toggle("Starters", isOn: $startersIsEnabled)
                    Toggle("Mains", isOn: $mainsIsEnabled)
                    Toggle("Desserts", isOn: $dessertsIsEnabled)
                    Toggle("Drinks", isOn: $drinksIsEnabled)
                }
                .toggleStyle(CategoryToggleStyle())
                .padding(.horizontal)
            }
            NavigationView {
                FetchedObjects(
                    predicate:buildPredicate(searchText: searchText),
                    sortDescriptors:buildSortDescriptors()
                ){ (dishes: [Dish]) in
                    List {
                        ForEach(dishes,id: \.self){ dish in
                            MenuItemView(dish: dish)
                        }
                    }
                }
            }
        }
         .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
            withAnimation {
                self.isKeyboardVisible = true
            }
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
            withAnimation {
                self.isKeyboardVisible = false
            }
        }
        .task {
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
         var search =  NSPredicate(value: true)
            if !searchText.isEmpty {
                // Return a predicate that always evaluates to true (no filtering)
                 // Build a predicate to filter entries containing searchText in name attribute
                search =  NSPredicate(format: "title CONTAINS[cd] %@", searchText)
             }
        let starters = !startersIsEnabled ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
        let mains = !mainsIsEnabled ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let desserts = !dessertsIsEnabled ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        let drinks = !drinksIsEnabled ? NSPredicate(format: "category != %@", "drinks") : NSPredicate(value: true)
        
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
        return compoundPredicate
     }
    
}

#Preview {
    //    Menu()
    Onboarding()
}
