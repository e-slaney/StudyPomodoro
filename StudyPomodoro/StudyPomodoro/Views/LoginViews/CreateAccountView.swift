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
            Color(red: 1.0, green: 0.58, blue: 0.56)
                    .ignoresSafeArea()
            ScrollView {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 190, height: 190)
                        .shadow(radius: 3.0, x: 3.0)
                    BounceAnimationImageView(image: "SPCreateAccount", startTime: 0.0)
                        .offset(x: 0, y: 25)
                        .shadow(radius: 3.0, x: 3.0)
                }
                VStack(alignment: .leading) {
                    Text("Create Account")
                        .font(.custom("Chalkboard SE", size: 32))
                    Spacer()
                    Text("First Name")
                        .font(.custom("Chalkboard SE", size: 24))
                    TextField("First Name", text: $firstName)
                        .font(.custom("Chalkboard SE", size: 20))
                        .textFieldStyle(.roundedBorder)
                        .shadow(radius: 3.0, x: 3.0)
                    Text("Last Name")
                        .font(.custom("Chalkboard SE", size: 24))
                    TextField("Last Name", text: $lastName)
                        .font(.custom("Chalkboard SE", size: 20))
                        .textFieldStyle(.roundedBorder)
                        .shadow(radius: 3.0, x: 3.0)
                    Text("Email")
                        .font(.custom("Chalkboard SE", size: 24))
                    TextField("Email", text: $email)
                        .font(.custom("Chalkboard SE", size: 20))
                        .textFieldStyle(.roundedBorder)
                        .shadow(radius: 3.0, x: 3.0)
                    Text("Password")
                        .font(.custom("Chalkboard SE", size: 24))
                    SecureField("Password", text: $password)
                        .font(.custom("Chalkboard SE", size: 20))
                        .textFieldStyle(.roundedBorder)
                        .shadow(radius: 3.0, x: 3.0)
                }
                .padding(.leading)
                .padding(.trailing)
                Button {
                    withAnimation {
                        createAccount.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20.0)
                            .foregroundColor(.red)
                            .frame(height: 50)
                            .shadow(radius: 3.0, x: 3.0)
                        Text("Create Account")
                            .foregroundColor(.white).font(.custom("Chalkboard SE", size: 20))
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
