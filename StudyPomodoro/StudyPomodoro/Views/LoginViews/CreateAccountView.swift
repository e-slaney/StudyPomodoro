//
//  CreateAccountView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 8/9/23.
//

import SwiftUI

struct CreateAccountView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @Binding var createAccount: Bool
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 1.0, green: 0.88, blue: 0.86), Color(red: 1.0, green: 0.58, blue: 0.56)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            ScrollView {
                //Cancel Button
                HStack {
                    Button {
                        withAnimation {
                            createAccount.toggle()
                        }
                    } label: {
                        ZStack {
                            Image(systemName: "multiply")
                                .font(.system(size: 32))
                                .foregroundColor(.white)
                                .shadow(radius: 3.0, x: 3.0, y: 3.0)
                            
                        }
                        
                    }
                    Spacer()
                }
                .padding(.leading)
                
                //Logo
                Image("SPCreateAccount")
                    .resizable()
                    .frame(width: 175, height: 175)
                    .offset(x: 0, y: 15)
                    .shadow(radius: 3.0, x: 3.0, y: 3.0)
                
                //Create Account Form
                VStack(alignment: .leading) {
                    Text("Create Account")
                        .font(.custom("Avenir Next", size: 32))
                        .fontWeight(.bold)
                    Spacer()
                    Text("First Name")
                        .font(.custom("Avenir Next", size: 24))
                    TextField("First Name", text: $firstName)
                        .font(.custom("Avenir Next", size: 20))
                        .textFieldStyle(.roundedBorder)
                        .shadow(radius: 3.0, x: 3.0, y: 3.0)
                        .cornerRadius(20.0)
                    Text("Last Name")
                        .font(.custom("Avenir Next", size: 24))
                    TextField("Last Name", text: $lastName)
                        .font(.custom("Avenir Next", size: 20))
                        .textFieldStyle(.roundedBorder)
                        .shadow(radius: 3.0, x: 3.0, y: 3.0)
                        .cornerRadius(20.0)
                    Text("Email")
                        .font(.custom("Avenir Next", size: 24))
                    TextField("Email", text: $email)
                        .font(.custom("Avenir Next", size: 20))
                        .textFieldStyle(.roundedBorder)
                        .shadow(radius: 3.0, x: 3.0, y: 3.0)
                        .cornerRadius(20.0)
                    Text("Password")
                        .font(.custom("Avenir Next", size: 24))
                    SecureField("Password", text: $password)
                        .font(.custom("Avenir Next", size: 20))
                        .textFieldStyle(.roundedBorder)
                        .shadow(radius: 3.0, x: 3.0, y: 3.0)
                        .cornerRadius(20.0)
                }
                .padding(.leading)
                .padding(.trailing)
                Button {
                    withAnimation {
                        createAccount.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .foregroundColor(.red)
                            .frame(height: 50)
                            .shadow(radius: 3.0, x: 3.0, y: 3.0)
                        Text("Create Account")
                            .foregroundColor(.white).font(.custom("Avenir Next", size: 20))
                    }
                }
                .padding()
            }
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView(createAccount: .constant(true))
    }
}
