//
//  EndSessionView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 7/21/23.
//

import SwiftUI

struct EndSessionView: View {
    @State private var selected = 3
    @State private var location: String = ""
    @Binding var submissionFormPresented: Bool
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Form {
                VStack {
                    Text("How would you rate your session today?")
                    Picker("", selection: $selected) {
                        Text("1").tag(0)
                        Text("2").tag(1)
                        Text("3").tag(2)
                        Text("4").tag(3)
                        Text("5").tag(4)
                    }
                    .pickerStyle(.segmented)
                }
                VStack {
                    Text("Where did you study today?")
                    TextField("Location", text: $location)
                        .multilineTextAlignment(.center)
                }
            }
            Button {
                withAnimation {
                    submissionFormPresented.toggle()
                    isPresented.toggle()
                }
            } label: {
                Text("Submit")
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.green)
            .padding(50)
            
        }
    }
}
