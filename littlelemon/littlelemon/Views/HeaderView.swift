//
//  HeaderView.swift
//  littlelemon
//
//  Created by Linval Muchapirei on 8/8/2024.
//

import SwiftUI

struct HeaderView: View {
    @State var isLoggedIn = false
    var body: some View {
//        NavigationView {
            VStack {
                ZStack {
                    Image("logo")
                    HStack {
                        Spacer()
                        if isLoggedIn {
                            NavigationLink(destination: UserProfile()) {
                                Image("profile-image-placeholder")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(maxHeight: 50)
                                    .clipShape(Circle())
                                    .padding(.trailing)
                            }
                        }
                    }
                }
//            }
        }
        .frame(maxHeight:60)
        .padding(.bottom)
        .onAppear {
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                isLoggedIn = true
            } else {
                isLoggedIn = false
            }
        }
    }
}

#Preview {
    HeaderView()
}
