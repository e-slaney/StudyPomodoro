//
//  ContentView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 7/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var loggedIn: Bool = false
    
    var body: some View {
        if(loggedIn) {
            HomeView()
                .transition(.move(edge: .trailing))
        } else {
            AuthView(loggedIn: $loggedIn)
                .transition(.move(edge: .leading))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
