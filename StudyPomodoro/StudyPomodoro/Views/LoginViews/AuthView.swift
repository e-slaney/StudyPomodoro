//
//  AuthView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 7/21/23.
//

import SwiftUI

struct AuthView: View {
    
    @State var hasAccount: Bool = true
    let originalString = Array("StudyPomodoro")
    @State var currentString: String = ""
    @State var scale = 0.0
    @Binding var loggedIn: Bool
    
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<originalString.count, id: \.self) { i in
                    ZStack {
                        Text(String(originalString[i]))
                            .font(.custom("Go-Mocha", size: 60))
                            .padding(-4)
                            .scaleEffect(scale)
                            .foregroundColor(.white)
                    }
                    
                }
            }
            .onAppear {
                //Scale
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        scale = 1.0
                    }
                }
            }
            if(hasAccount) {
                LoginView(loggedIn: $loggedIn)
                    .transition(.move(edge: .leading))
            } else {
                CreateAccountView()
                    .transition(.move(edge: .trailing))
            }
        }
        .background(.green.gradient)
    }
}

