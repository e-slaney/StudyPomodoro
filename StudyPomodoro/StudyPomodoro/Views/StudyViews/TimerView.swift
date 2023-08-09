//
//  TimerView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 7/21/23.
//

import SwiftUI

struct TimerView: View {
    
    var cycleSelections: [String] = ["pomodoro", "shortBreak", "longBreak"]
    @State var cycle: String = "pomodoro"
    @State var pomodoroCount: Int = 0
    @State var countdownSeconds: Int = (25*60)
    @State var minutes: String = String(25)
    @State var seconds: String = "00"
    @State var isCountingDown = false
    @State var endAngle: Angle = Angle(degrees: 360)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var showingEndAlert: Bool = false
    @Binding var isPresented: Bool
    @Binding var submissionFormPresented: Bool

        
    var body: some View {
        if(submissionFormPresented) {
            //
        } else {
            GeometryReader { geom in
                VStack {
                    ZStack {
                        Path { path in
                            let center = CGPoint(x: geom.size.width / 2, y: geom.size.height / 2)
                            let radius = 150.0
                            let startAngle = Angle(degrees: 0)
                            let endAngle = self.endAngle
                            
                            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                        }
                        .stroke(Color.green.gradient, lineWidth: 10)
                        VStack {
                            Text("\(minutes):\(seconds)")
                                .onReceive(timer) { _ in
                                    if(isCountingDown) {
                                        countdownSeconds -= 1
                                        let (minutes, seconds) = secondsToMinutesSeconds(countdownSeconds)
                                        if(minutes < 10) {
                                            self.minutes = "0" + String(minutes)
                                        } else {
                                            self.minutes = String(minutes)
                                        }
                                        if(seconds < 10) {
                                            self.seconds = "0" + String(seconds)
                                        } else {
                                            self.seconds = String(seconds)
                                        }
                                        
                                        var totalCount: Int
                                        if(cycle == "pomodoro") {
                                            totalCount = (60*25)
                                        } else if(cycle == "shortBreak") {
                                            totalCount = (60*5)
                                        } else {
                                            totalCount = (60*15)
                                        }
                                        
                                        self.endAngle = Angle(degrees: Double(360 * countdownSeconds) / Double(totalCount))
                                        if(countdownSeconds == 0) {
                                            isCountingDown = false
                                            setTimer()
                                        }
                                    }
                                }
                                .font(.system(size: 52))
                            HStack {
                                if(isCountingDown) {
                                    Button {
                                        stopTimer()
                                    } label: {
                                        Image(systemName: "pause.fill")
                                            .font(.system(size: 52))
                                            .padding(15)
                                    }
                                } else {
                                    Button {
                                        startTimer()
                                    } label: {
                                        Image(systemName: "play.fill")
                                            .font(.system(size: 52))
                                            .padding(15)
                                    }
                                }
                                Button {
                                    stopTimer()
                                    showingEndAlert = true
                                } label: {
                                    Image(systemName: "stop.fill")
                                }
                                .font(.system(size: 52))
                                .padding(15)
                                .alert(isPresented: $showingEndAlert) {
                                    Alert(title: Text("Are you sure you want to end the session?"), message: Text(""), primaryButton: .destructive(Text("End Session")) {
                                        withAnimation {
                                            submissionFormPresented = true
                                        }
                                    }, secondaryButton: .default(Text("Continue Studying")))
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    private func setTimer() {
        if(cycle == "pomodoro") {
            pomodoroCount = pomodoroCount + 1
            if(pomodoroCount % 4 == 0) {
                cycle = "longBreak"
            } else {
                cycle = "shortBreak"
            }
        } else {
            cycle = "pomodoro"
        }
        
        if(cycle == "longBreak") {
            countdownSeconds = (15*60)
        } else if(cycle == "shortBreak") {
            countdownSeconds = (5*60)
        } else {
            countdownSeconds = (25*60)
        }
        
        let (minutes, seconds) = secondsToMinutesSeconds(countdownSeconds)
        if(minutes < 10) {
            self.minutes = "0" + String(minutes)
        } else {
            self.minutes = String(minutes)
        }
        if(seconds < 10) {
            self.seconds = "0" + String(seconds)
        } else {
            self.seconds = String(seconds)
        }
        
        self.endAngle = Angle(degrees: 360)
        
    }
    
    private func startTimer() {
        isCountingDown = true
    }
    
    private func stopTimer() {
        isCountingDown = false
    }
    
    private func pauseTimer() {
        isCountingDown = false
    }
    
    private func secondsToMinutesSeconds(_ seconds: Int) -> (Int, Int) {
        return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
}
