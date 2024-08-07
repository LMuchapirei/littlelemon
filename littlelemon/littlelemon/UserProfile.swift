//
//  UserProfile.swift
//  littlelemon
//
//  Created by Linval Muchapirei on 7/8/2024.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    let firstName: String  = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    let lastName: String  = UserDefaults.standard.string(forKey: kLastName) ?? ""
    let email: String  = UserDefaults.standard.string(forKey: kEmail) ?? ""
    var body: some View {
        VStack {
            Text("Personal Information")
            Image("profile-image-placeholder")
            Text(firstName)
            Text(lastName)
            Text(email)
            Button("Logout"){
                
            }
        }
    }
}

#Preview {
    UserProfile()
}
