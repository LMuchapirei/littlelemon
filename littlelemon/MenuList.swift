//
//  MenuList.swift
//  littlelemon
//
//  Created by Linval Muchapirei on 7/8/2024.
//

import Foundation


struct MenuList: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
            case menu = "menu"
    }
}
