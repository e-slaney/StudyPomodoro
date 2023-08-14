//
//  LoginPageView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 8/8/23.
//

import SwiftUI

struct LoginPageView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var logInPressed: Bool = false
    @Binding var createAccount: Bool
    @Binding var loggedIn: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 1.0, green: 0.88, blue: 0.86), Color(red: 1.0, green: 0.58, blue: 0.56)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(alignment: .center) {
                //Logo
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 200)
                        .shadow(radius: 3.0, x: 3.0, y: 3.0)
                    VStack {
                        BounceAnimationView(text: "Study", startTime: 0.5)
                            .offset(x: 0, y: 50)
                            .shadow(radius: 2.0, x: 3.0, y: 3.0)
                            .foregroundColor(.red)
                        BounceAnimationImageView(image: "SPLogo", startTime: 0.0, width: 175.0, height: 175.0)
                            .offset(x: 0, y: -10)
                            .shadow(radius: 3.0, x: 3.0, y: 3.0)
                        BounceAnimationView(text: "Pomodoro", startTime: 1.0)
                            .offset(x: 0, y: -70)
                            .shadow(radius: 2.0, x: 3.0, y: 3.0)
                            .foregroundColor(.red)
                    }
                }
                .padding(.top, -40)
                .padding(.bottom, -50)
                //Email sign-in
                VStack(alignment: .leading) {
                    Text("Sign In")
                        .font(.custom("Avenir Next", size: 32))
                        .padding(.bottom)
                        .fontWeight(.bold)
                    Text("Email")
                        .padding(.bottom, -5)
                        .font(.custom("Avenir Next", size: 24))
                    TextField("Email", text: $email)
                        .font(.custom("Avenir Next", size: 20))
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(20.0)
                        .padding(.bottom)
                        .shadow(radius: 3.0, x: 3.0, y: 3.0)

                    //Password sign-in
                    Text("Password")
                        .padding(.bottom, -5)
                        .font(.custom("Avenir Next", size: 24))
                    SecureField("Password", text: $password)
                        .font(.custom("Avenir Next", size: 20))
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(20.0)
                        .shadow(radius: 3.0, x: 3.0, y: 3.0)

                    //Sign-in button
                    
                    Button {
                        withAnimation(.easeIn(duration: 1.0)) {
                            loggedIn.toggle()
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.red)
                                .frame(height: 50)
                                .shadow(radius: 3.0, x: 3.0, y: 3.0)

                            Text("Sign in")
                                .foregroundColor(.white).font(.custom("Avenir Next", size: 20))
                        }
                    }
                    .padding([.top, .bottom])
                    HStack {
                        Button {
                            
                        } label: {
                            Text("Forgot Password?")
                                .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                        }
                        Spacer()
                        Button {
                            withAnimation {
                                createAccount.toggle()
                            }
                        } label : {
                            Text("Create New Account")
                                .foregroundColor(Color(red: 0.6, green: 0.0, blue: 0.0))
                        }
                    }
                    .font(.custom("Avenir Next", size: 16))
                }
                .padding(20)
            }
            .frame(alignment: .leading)
        }
    }
}


/*
All credit for this view goes to chitomo12 on GitHub.
Base code was used form their SWIFTUI-Text-Animation Library.
Modified for personal use.
github.com/chitomo12/SwiftUI-Text-Animation-Library/tree/main
*/
struct BounceAnimationView: View {
    let characters: Array<String.Element>
    
    @State var offsetYForBounce: CGFloat = -50.0
    @State var opacity: CGFloat = 0
    @State var baseTime: Double
    @State var rotationEffect: Angle = Angle(degrees: 45)
    
    init(text: String, startTime: Double) {
        self.characters = Array(text)
        self.baseTime = startTime
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<characters.count, id: \.self) { i in
                Text(String(self.characters[i]))
                    .font(.custom("Chalkboard SE", fixedSize: 58))
                    .fontWeight(.bold)
                    .offset(x: 0.0, y: offsetYForBounce)
                    .opacity(opacity)
                    .animation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0.1).delay(Double(i) * 0.1), value: offsetYForBounce)
                    .rotationEffect(rotationEffect)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + (0.8 + baseTime)) {
                    opacity = 1
                    offsetYForBounce = 0
                    withAnimation(.spring(response: 0.75, dampingFraction: 0.75)) {
                        rotationEffect = Angle(degrees: 5)
                    }
                }
            }
        }
    }
}

struct BounceAnimationImageView: View {
    
    @State var image: String
    @State var offsetYForBounce: CGFloat = -100.0
    @State var opacity: CGFloat = 0
    @State var baseTime: Double
    @State var rotationEffect: Angle = Angle(degrees: 45)
    @State var width: CGFloat
    @State var height: CGFloat
    
    init(image: String, startTime: Double, width: CGFloat, height: CGFloat) {
        self.image = image
        self.baseTime = startTime
        self.width = width
        self.height = height
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Image("\(self.image)")
                .resizable()
                .frame(width: width, height: height)
                .offset(x: 0.0, y: offsetYForBounce)
                .opacity(opacity)
                .animation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0.1), value: offsetYForBounce)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + (0.8 + baseTime)) {
                opacity = 1
                offsetYForBounce = -10
            }
        }
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView(createAccount: .constant(false), loggedIn: .constant(false))
    }
}
