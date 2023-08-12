//
//  StudyView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 8/11/23.
//

import SwiftUI

struct StudyView: View {
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 1.0, green: 0.35, blue: 0.35), .red], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                TimerView()
            }
        }
        
    }
}

struct StudyView_Previews: PreviewProvider {
    static var previews: some View {
        StudyView()
    }
}
