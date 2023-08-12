//
//  TimerView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 7/21/23.
//

import SwiftUI

struct TimerView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var cycleSelections: [String] = ["pomodoro", "shortBreak", "longBreak"]
    @State var cycle: String = "pomodoro"
    @State var pomodoroCount: Int = 0
    @State var countdownSeconds: Int = (60)
    @State var minutes: String = String(1)
    @State var seconds: String = "00"
    @State var isCountingDown = false
    @State var endAngle: Angle = Angle(degrees: 360)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var showingEndAlert: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.leading)
                            .font(.custom("Futura", size: 26))
                    }
                    Spacer()
                }
                ZStack {
                    TimerArc(endAngle: $endAngle)
                    VStack {
                        Text("\(minutes):\(seconds)")
                            .foregroundColor(.white)
                            .onReceive(timer) { _ in
                                countdownAdjustment()
                            }
                        HStack {
                            if(isCountingDown) {
                                Button {
                                    stopTimer()
                                } label: {
                                    Image(systemName: "pause.fill")
                                        .padding(15)
                                        .foregroundColor(.white)
                                }
                            } else {
                                Button {
                                    startTimer()
                                } label: {
                                    Image(systemName: "play.fill")
                                        .padding(15)
                                        .foregroundColor(.white)
                                }
                            }
                            Button {
                                stopTimer()
                                showingEndAlert = true
                            } label: {
                                Image(systemName: "stop.fill")
                                    .foregroundColor(.white)
                            }
                            .padding(15)
                        }
                    }
                }
            }
            .font(.custom("Futura", size: 60))
        }
        
    }
    
    private func countdownAdjustment() {
        if(isCountingDown) {
            countdownSeconds -= 1
            let (minutes, seconds) = secondsToMinutesSeconds(countdownSeconds)
            if(minutes < 10) {
                self.minutes = String(minutes)
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
            
            self.endAngle = Angle(degrees: Double(360 * countdownSeconds) / Double(60))
            if(countdownSeconds == 0) {
                isCountingDown = false
                setTimer()
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

struct TimerArc: View {
    @Binding var endAngle: Angle
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                Path { path in
                    let center = CGPoint(x: geom.size.width / 2, y: geom.size.height / 2)
                    let radius = 150.0
                    let startAngle = Angle(degrees: 0)
                    let endAngle = Angle(degrees: 360)
                    
                    path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                }
                .stroke(Color(red: 1.0, green: 0.68, blue: 0.66), lineWidth: 8.0)
                Path { path in
                    let center = CGPoint(x: geom.size.width / 2, y: geom.size.height / 2)
                    let radius = 150.0
                    let startAngle = Angle(degrees: 0)
                    let endAngle = self.endAngle
                    
                    path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                }
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round))
                .foregroundColor(Color(red: 0.5, green: 0.0, blue: 0.0))
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
