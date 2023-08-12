//
//  Tester.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 8/9/23.
//

import SwiftUI

struct Tester: View {
    var body: some View {
        ScrollView {
            ForEach(0..<10, id: \.self) { _ in
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 300, height: 300)
            }
        }
    }
}

struct Tester_Previews: PreviewProvider {
    static var previews: some View {
        Tester()
    }
}
