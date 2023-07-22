//
//  LoginView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 7/21/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @Binding var loggedIn: Bool
    
    var body: some View {
        
        VStack {
            Spacer()
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
                .font(.custom("GillSans-SemiboldItalic", size: 32))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                        .foregroundColor(.white))
                .padding()
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .font(.custom("GillSans-SemiboldItalic", size: 32))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                        .foregroundColor(.white))
                .padding()
            Button("Log In") {
                withAnimation {
                    loggedIn.toggle()
                }
            }
            .buttonStyle(.bordered)
            .font(.custom("GillSans-SemiboldItalic", size: 32))
            .tint(Color.white)
            Spacer()
        }
    }
}

