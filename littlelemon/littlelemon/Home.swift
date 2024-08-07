//
//  Home.swift
//  littlelemon
//
//  Created by Linval Muchapirei on 7/8/2024.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Menu()
                .tabItem { Label("Menu",systemImage: "list.dash") }
        }
    }
}

#Preview {
    Home()
}
