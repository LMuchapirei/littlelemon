//
//  UserProfile.swift
//  littlelemon
//
//  Created by Linval Muchapirei on 7/8/2024.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    @State var  firstName: String  = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State var lastName: String  = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State var email: String  = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @State var phoneNumber: String  = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""
    var body: some View {
        VStack {
            Text("Personal Information")
                .font(.title2)
            HStack {
                Image("profile-image-placeholder")
                    .resizable()
                    .frame(width: 80,height: 80)
                Button("Change"){
                    
                }
                .buttonStyle(ButtonStylePrimaryColor())
                
                Button("Remove"){
                    
                }
                .buttonStyle(ButtonStylePrimaryColorReverse())
            }
            VStack {
                Text("First Name *")
                    .textStyleOnboarding()
                TextField("First Name",text:$firstName)
                    .padding(.top,10)
                Text("Last Name *")
                    .textStyleOnboarding()
                TextField("Last Name",text:$lastName)
                Text("Phone Number *")
                    .textStyleOnboarding()
                TextField("Phone Number",text:$phoneNumber)
                Text("Email *")
                    .textStyleOnboarding()
                TextField("Email",text:$email)
                    .keyboardType(.emailAddress)
            }
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .padding()
            .padding(.top,12)
            Button("Logout"){
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            .buttonStyle(ButtonStylePrimary2Wide())
            
            HStack {
                
                Button("Discard Changes"){
                    
                }
                .buttonStyle(ButtonStylePrimaryColorReverse())
                
                Button("Save Changes"){
                    
                }
                .buttonStyle(ButtonStylePrimaryColor())
            }
        }
    }
}

#Preview {
    UserProfile()
}
