//
//  SessionView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 7/21/23.
//

import SwiftUI

struct SessionView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        Button("Begin session") {
            withAnimation {
                isPresented.toggle()
            }
        }
    }
}
