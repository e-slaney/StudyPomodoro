//
//  UserModel.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 7/20/23.
//

import Foundation

class User {
    private var sessions: [Session]
    
    init(sessions: [Session]) {
        self.sessions = sessions
    }
}

class Session {
    private var date: Date
    private var pomodoroCount: Int
    private var productivityRating: Int
    private var location: String?
    
    init(pomodoros: Int, rating: Int, location: String?) {
        self.date = Date.now
        if(location != nil) {
            self.location = location
        } else {
            self.location = ""
        }
        self.pomodoroCount = pomodoros
        self.productivityRating = rating
    }
}
