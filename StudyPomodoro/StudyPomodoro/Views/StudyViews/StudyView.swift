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
