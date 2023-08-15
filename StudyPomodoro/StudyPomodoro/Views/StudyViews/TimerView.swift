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
            LinearGradient(colors: [Color(red: 1.0, green: 0.35, blue: 0.35), .red], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
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
                    Text("\(minutes):\(seconds)")
                        .font(.custom("Futura", size: 60))
                        .foregroundColor(.white)
                        .onReceive(timer) { _ in
                            countdownAdjustment()
                        }
                }
                HStack {
                    if(isCountingDown) {
                        Button {
                            stopTimer()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15.0)
                                    .frame(width: 160, height: 60)
                                    .foregroundColor(.white)
                                    .shadow(radius: 3.0, x: 3.0, y: 3.0)
                                Text("Pause")
                                    .foregroundColor(.red)
                                    .font(.custom("Futura", size: 32))
                            }
                        }
                        .padding([.leading, .trailing])
                    } else {
                        Button {
                            startTimer()
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15.0)
                                    .frame(width: 160, height: 60)
                                    .foregroundColor(.white)
                                    .shadow(radius: 3.0, x: 3.0, y: 3.0)
                                Text("Start")
                                    .foregroundColor(.red)
                                    .font(.custom("Futura", size: 32))
                            }
                        }
                        .padding([.leading, .trailing])
                    }
                    Button {
                        stopTimer()
                        showingEndAlert = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15.0)
                                .frame(width: 160, height: 60)
                                .foregroundColor(.white)
                                .shadow(radius: 3.0, x: 3.0, y: 3.0)
                            Text("Stop")
                                .foregroundColor(.red)
                                .font(.custom("Futura", size: 32))
                        }
                    }
                    .padding([.leading, .trailing])
                    
                }
                LineBreakView()
                TaskListView()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
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

struct LineBreakView: View {
    
    var body: some View {
        GeometryReader { geom in
            Path { path in
                path.move(to: CGPoint(x: 25, y: 25))
                path.addLine(to: CGPoint(x: geom.size.width - 25, y: 25))
            }
            .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round))
            .opacity(0.2)
        }
        .frame(height: 30)
        VStack {
            Text("Focus Tasks")
        }
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
        .frame(height: 340)
        .navigationBarBackButtonHidden(true)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
