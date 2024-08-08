//
//  Onboarding.swift
//  littlelemon
//
//  Created by Linval Muchapirei on 7/8/2024.
//

import SwiftUI



struct Onboarding: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @StateObject private var viewModel = OnboardingViewModel()
    @State private var isLoggedIn: Bool = false
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators:false){
                VStack {
                    HeaderView()
                    Hero()
                        .padding()
                        .background(Color.primaryColor)
                        .frame(maxWidth: .infinity, maxHeight: 280)
                    NavigationLink(
                        destination:Home(),isActive: $isLoggedIn){
                            
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
                    Spacer()
                    Button("Register")
                    {
                        
                        if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            firstName = ""
                            lastName = ""
                            email = ""
                            isLoggedIn = true
                        }
                    }
                    .buttonStyle(ButtonStylePrimary2Wide())
                    
                    if viewModel.errorMessageShow {
                        withAnimation() {
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                        }
                    }
                    
                }
                .onAppear{
                    if  UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                        isLoggedIn = true
                    }
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}
