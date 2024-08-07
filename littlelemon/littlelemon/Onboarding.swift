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
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    
    @State private var isLoggedIn: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination:Home(),isActive: $isLoggedIn){
                    EmptyView()
                }
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
                                UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            }
                            
                            isLoggedIn=true
                        }
                 .padding(.horizontal,20)
                 .padding(.vertical,10)
                 .background(.green,in:.rect(cornerRadius: 10))
                 .foregroundColor(.white)
            }
            .onAppear{
                if  UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}
