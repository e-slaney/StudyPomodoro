//
//  StudyScreenView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 7/20/23.
//

import SwiftUI

struct StudyScreenView: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
                ZStack {
                    if isPresented {
                        StudyView(isPresented: $isPresented)
                            .transition(.move(edge: .top))
                    } else{
                        SessionView(isPresented: $isPresented)
                            .transition(.move(edge: .bottom))
                    }
                }
            }
        
    }
    
}

struct NavBackButton: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        Button {
            withAnimation {
                isPresented.toggle()
            }
        } label: {
            HStack {
                Image(systemName: "x.circle.fill")
                Text("Exit Session")
                Spacer()
            }
            .padding(15)
            .foregroundColor(Color.red)
        }
    }
}

struct StudyScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StudyScreenView()
    }
}
