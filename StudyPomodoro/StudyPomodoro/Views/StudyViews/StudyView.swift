//
//  StudyView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 7/21/23.
//

import SwiftUI


struct StudyView: View {
    
    @Binding var isPresented: Bool
    @State var submissionFormPresented: Bool = false
    
    var body: some View {
        VStack {
            if(!submissionFormPresented) {
                NavBackButton(isPresented: $isPresented)
            }
            TimerView(isPresented: $isPresented, submissionFormPresented: $submissionFormPresented)
            if(!submissionFormPresented) {
                TaskListView()
            }
        }
    }
}
