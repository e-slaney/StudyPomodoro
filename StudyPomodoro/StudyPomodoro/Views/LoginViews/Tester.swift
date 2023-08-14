//
//  Tester.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 8/9/23.
//

import SwiftUI

struct Tester: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                SettingsButton()
            }
            Text("QUOTE")
                .font(.custom("Futura", size: 22))
                .multilineTextAlignment(.leading)
                .padding([.leading, .trailing], 50)
            HStack {
                Spacer()
                Text("AUTHOR")
                    .font(.custom("Futura", size: 20))
                    .padding()
            }
            NavigationLink {
                StudyView()
            } label: {
                StudyButton()
            }
            
            StatisticsButton()
            
            ProfileButton()
            
            Spacer()

        }
    }
}

struct OtherSample: View {
    var body: some View {
        VStack {
            Text("Animated Effect1")
                .transition(.move(edge: .top))
                .padding()
            Text("Animated Effect2")
                .animation(.linear(duration: 3.5))
                .padding()
            Text("Animated Effect3")
                .transition(.scale(scale: 300))
                .padding()
            Text("Animated Effect4")
                .transition(.slide)
                .padding()
        }
    }
}


struct Tester_Previews: PreviewProvider {
    static var previews: some View {
        Tester()
    }
}
