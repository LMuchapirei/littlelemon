//
//  View+Extensions.swift
//  littlelemon
//
//  Created by Linval Muchapirei on 8/8/2024.
//

import SwiftUI

extension Color {
    static var primaryColor = Color("primaryColor")
    static var primaryColor_2 = Color("primaryColor2")
    static var secondary = Color("secondaryColor")
    static var secondary2 = Color("secondaryColor2")
    static var secondary3 = Color("secondaryColor3")
    static var secondary4 = Color("secondaryColor4")
}

extension View {
    func textStyleOnboarding()-> some View  {
        self.frame(maxWidth:.infinity,alignment:.leading)
            .foregroundColor(.primaryColor)
            .font(.custom("Karla-Bold", size: 14))
    }
}


extension Font {
    static func displayFont() -> Font {
        return Font.custom("Markazi Text", size: 42).weight(.medium)
    }
    
    static func subTitleFont() -> Font {
        return Font.custom("Markazi Text", size: 32)
    }
    
    static func leadText() -> Font {
        return Font.custom("Karla", size: 16).weight(.medium)
    }
    
    static func regularText() -> Font {
        return Font.custom("Markazi Text", size: 18)
    }
    
    static func sectionTitle() -> Font {
        return Font.custom("Karla", size: 18).weight(.black)
    }
    
    static func sectionCategories() -> Font {
        return Font.custom("Karla", size: 16).weight(.heavy)
    }
    
    static func paragraphText() -> Font {
        return Font.custom("Karla", size: 14)
    }
    
    static func highlightText() -> Font {
        return Font.custom("Karla", size: 14).weight(.medium)
    }
}

struct ButtonStylePrimary2Wide: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .white : .black)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor : Color.primaryColor2)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct ButtonStylePrimaryColor: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.primaryColor : .white)
            .padding(10)
            .background(configuration.isPressed ? .white : Color.primaryColor)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

struct ButtonStylePrimaryColorReverse: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .white : Color.primaryColor)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor : .white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

struct CategoryToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
            }
        }
        .foregroundColor(Color.primaryColor)
        .padding(5)
        .background {
            if configuration.isOn {
                Color.secondaryColor3
            }
        }
        .cornerRadius(8)
    }
}
