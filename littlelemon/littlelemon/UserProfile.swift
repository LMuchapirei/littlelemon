//
//  UserProfile.swift
//  littlelemon
//
//  Created by Linval Muchapirei on 7/8/2024.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    @StateObject private var viewModel = OnboardingViewModel()
    @State var  firstName: String  = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State var lastName: String  = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State var email: String  = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @State var phoneNumber: String  = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""
    @State var orderStatus = UserDefaults.standard.bool(forKey: kOrderStatuses) 
    @State var passwordChanges =  UserDefaults.standard.bool(forKey: kPasswordChanges)
    @State var specialOffers =  UserDefaults.standard.bool(forKey: kSpecialOffers)
    @State var newsLetter =  UserDefaults.standard.bool(forKey: kNewsletter)
    @State private var isLoggedOut = false
    var body: some View {
        VStack {
            NavigationLink(destination: Onboarding(), isActive: $isLoggedOut) { }
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
            
            Group {
                Text("Email Notifications")
                Toggle("Order statues",isOn: $orderStatus)
                Toggle("Password changes",isOn: $passwordChanges)
                Toggle("Special offers",isOn: $specialOffers)
                Toggle("Newsletter",isOn: $newsLetter)
            }
            .padding(.horizontal,15)

            
            Button("Logout"){
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            .buttonStyle(ButtonStylePrimary2Wide())
            
            
            HStack {
                
                Button("Discard Changes"){
                    firstName = viewModel.firstName
                    lastName = viewModel.lastName
                    email = viewModel.email
                    phoneNumber = viewModel.phoneNumber
                    
                    orderStatus = viewModel.orderStatuses
                    passwordChanges = viewModel.passwordChanges
                    specialOffers = viewModel.specialOffers
                    newsLetter = viewModel.newsletter
                    self.presentation.wrappedValue.dismiss()
                }
                .buttonStyle(ButtonStylePrimaryColorReverse())
                
                Button("Save Changes"){
                    if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                        UserDefaults.standard.set(orderStatus, forKey: kOrderStatuses)
                        UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
                        UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
                        UserDefaults.standard.set(newsLetter, forKey: kNewsletter)
                    }
                }
                .buttonStyle(ButtonStylePrimaryColor())
            }
        }
    }
}

#Preview {
    UserProfile()
}
