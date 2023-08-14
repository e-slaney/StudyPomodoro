//
//  ContentView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 7/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var loggedIn: Bool = false
    @State var createAccount: Bool = false
    @Namespace var namespace
    
    var body: some View {
        VStack {
            ZStack {
                if(loggedIn) {
                    HomeView(loggedIn: $loggedIn)
                        .transition(.move(edge: .trailing))
                } else {
                    if(createAccount) {
                        CreateAccountView(createAccount: $createAccount)
                            .transition(.move(edge: .bottom))
                    } else {
                        LoginPageView(createAccount: $createAccount, loggedIn: $loggedIn)
                        
                    }
                }
            }
        }
        
    }
}

extension AnyTransition {
    static var moveAndScale: AnyTransition {
        AnyTransition.move(edge: .bottom).combined(with: .scale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
