//
//  Tester.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 8/9/23.
//

import SwiftUI

struct Tester: View {
    var body: some View {
        VStack {
            BounceAnimationImageView(image: "SPLogo", startTime: 0.0)
        }
    }
}

struct Tester_Previews: PreviewProvider {
    static var previews: some View {
        Tester()
    }
}
