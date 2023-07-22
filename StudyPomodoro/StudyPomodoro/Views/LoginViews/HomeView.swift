//
//  HomeView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 7/20/23.
//

import SwiftUI

struct HomeView: View {
    
    private var user: String = "Evan"
    @State private var selection = 1
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                StudyScreenView()
                    .tabItem {
                        Text("Study")
                        Image(systemName: "pencil.line")
                    }
                Text("Stats Screen")
                    .tabItem {
                        Text("Stats")
                        Image(systemName: "chart.bar.fill")
                        
                    }
                Text("Profile Screen")
                    .tabItem {
                        Text("Profile")
                        Image(systemName: "person.fill")
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
