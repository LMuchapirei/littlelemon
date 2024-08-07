//
//  MenuItem.swift
//  littlelemon
//
//  Created by Linval Muchapirei on 7/8/2024.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    let id = UUID()
    let title : String
    let price : String
    // add code here
    enum CodingKeys: String, CodingKey {
           case title = "title"
           case price = "price"
       }
}

