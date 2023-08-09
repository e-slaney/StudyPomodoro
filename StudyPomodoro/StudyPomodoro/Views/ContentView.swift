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
    
    var body: some View {
        VStack {
            ZStack {
                if(loggedIn) {
                    Text("Will Eventually Be Home Page")
                } else {
                    if(createAccount) {
                        CreateAccountView(createAccount: $createAccount)
                    } else {
                        LoginPageView(createAccount: $createAccount)
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
