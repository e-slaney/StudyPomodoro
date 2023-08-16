//
//  Tester.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 8/9/23.
//

import SwiftUI

struct Tester: View {
    
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        ScrollView {
            ForEach(0..<50) { index in
                GeometryReader { geo in
                    Text("Row #\(index)")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .background(colors[index % 7])
                }
                .frame(height: 40)
            }
        }
    }
}




struct Tester_Previews: PreviewProvider {
    static var previews: some View {
        Tester()
    }
}
