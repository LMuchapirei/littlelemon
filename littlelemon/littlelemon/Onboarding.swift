//
//  Onboarding.swift
//  littlelemon
//
//  Created by Linval Muchapirei on 7/8/2024.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"

struct Onboarding: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    var body: some View {
        VStack {
            
            TextField("First Name",text:$firstName)
            TextField("Last Name",text:$lastName)
            TextField("Email",text:$email)
            
            Button("Register")
                    {
                        print("Register Hit")
                        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                        }
                    }
            .padding(.horizontal,20)
             .padding(.vertical,10)
             .background(.green,in:.rect(cornerRadius: 10))
             .foregroundColor(.white)
        }
    }
}

#Preview {
    Onboarding()
}
