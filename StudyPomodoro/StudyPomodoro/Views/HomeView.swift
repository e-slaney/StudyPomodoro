//
//  HomeView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 8/11/23.
//

import SwiftUI

struct HomeView: View {
    var quote: Quote = getQuote()
    @State var fadingQuote = false
    @State var fadingAuthor = false
    @Binding var loggedIn: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 1.0, green: 0.78, blue: 0.76)
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        NavigationLink {
                            EmptyView()
                        } label: {
                            SettingsButton()
                                .shadow(radius: 3.0, x: 3.0, y: 3.0)
                                .padding(.bottom, 50)
                        }
                    }
                    .padding([.leading, .trailing])
    
                    Spacer()
                    NavigationLink {
                        StudyView()
                    } label: {
                        StudyButtonFadeView(startTime: 1.0)
                            .padding(.leading, 25)
                    }
                    .padding(.bottom)
                    
                    NavigationLink {
                        EmptyView()
                    } label: {
                        StatisticsButtonFadeView(startTime: 1.5)
                            .padding(.leading, 25)
                    }
                    .padding(.bottom)
                    
                    NavigationLink {
                        EmptyView()
                    } label: {
                        ProfileButtonFadeView(startTime: 2.0)
                            .padding(.leading, 25)
                    }
                    .padding(.bottom)
                    
                    Spacer()
                    
                    FadingQuoteView(startTime: 2.5)
                    
                    Spacer()
                }
            }
        }
    }
}

struct FadingQuoteView: View {
    
    @State var opacity: CGFloat = 0
    @State var baseTime: Double
    
    init(startTime: Double) {
        self.baseTime = startTime
    }
    
    var body: some View {
        HStack(spacing: 0) {
            QuoteView()
            .buttonStyle(.borderedProminent)
            .opacity(opacity)
            .animation(.easeIn(duration: 1.0), value: opacity)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + (0.8 + baseTime)) {
                withAnimation {
                    opacity = 1
                }
            }
        }
    }
}

struct QuoteView: View {
    
    @State var quote = getQuote()
    
    var body: some View {
        VStack {
            Text("\(quote.text)")
                .font(.custom("Avenir Next", size: 22))
                .multilineTextAlignment(.leading)
                .padding(.leading)
            HStack {
                Spacer()
                Text("\(quote.author)")
                    .font(.custom("Avenir Next", size: 20))
                    .padding(.trailing, 50)
            }
        }
    }
}

struct StudyButton: View {
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundColor(.red)
                .frame(height: 60)
                .shadow(radius: 2.0, x: 3.0, y: 3.0)
            HStack {
                Text("Study")
                    .foregroundColor(.white)
                Image(systemName: "deskclock.fill")
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .font(.custom("Avenir Next", size: 24))
            .fontWeight(.semibold)
        }
        .frame(width: 190)
    }
}

struct StatisticsButton: View {
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundColor(.red)
                .frame(height: 60)
                .shadow(radius: 2.0, x: 3.0, y: 3.0)
            HStack {
                Text("Statistics")
                    .foregroundColor(.white)
                Image(systemName: "chart.bar.fill")
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .font(.custom("Avenir Next", size: 24))
            .fontWeight(.semibold)
        }
        .frame(width: 190)
    }
}

struct ProfileButton: View {
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundColor(.red)
                .frame(height: 60)
                .shadow(radius: 2.0, x: 3.0, y: 3.0)
            HStack() {
                Text("Profile")
                    .foregroundColor(.white)
                Image(systemName: "person.crop.circle.fill")
                    .foregroundColor(.white)
                Spacer()
            }
            .font(.custom("Avenir Next", size: 24))
            .fontWeight(.semibold)
            .padding()
        }
        .frame(width: 190)
    }
}

struct StudyButtonFadeView: View {
    
    @State var offsetXForBounce: CGFloat = 100.0
    @State var opacity: CGFloat = 0
    @State var baseTime: Double
    @State var rot3D: Angle = Angle(degrees: 90)
    
    init(startTime: Double) {
        self.baseTime = startTime
    }
    
    var body: some View {
        HStack(spacing: 0) {
            StudyButton()
            .buttonStyle(.borderedProminent)
            .offset(x: offsetXForBounce, y: 0.0)
            .opacity(opacity)
            .animation(.linear(duration: 1.0), value: offsetXForBounce)
            .rotation3DEffect(rot3D, axis: (x: 0.0, y: 1.0, z: 0.0))
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + (0.8 + baseTime)) {
                withAnimation {
                    offsetXForBounce = -10
                    opacity = 1
                    rot3D = Angle(degrees: 0)
                }
            }
        }
    }
}

struct StatisticsButtonFadeView: View {
    
    @State var offsetXForBounce: CGFloat = 100.0
    @State var opacity: CGFloat = 0
    @State var baseTime: Double
    @State var rot3D: Angle = Angle(degrees: 90)
    
    init(startTime: Double) {
        self.baseTime = startTime
    }
    
    var body: some View {
        HStack(spacing: 0) {
            StatisticsButton()
            .buttonStyle(.borderedProminent)
            .offset(x: offsetXForBounce, y: 0.0)
            .opacity(opacity)
            .animation(.linear(duration: 1.0), value: offsetXForBounce)
            .rotation3DEffect(rot3D, axis: (x: 0.0, y: 1.0, z: 0.0))
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + (0.8 + baseTime)) {
                withAnimation {
                    offsetXForBounce = -10
                    opacity = 1
                    rot3D = Angle(degrees: 0)
                }
            }
        }
    }
}

struct ProfileButtonFadeView: View {
    
    @State var offsetXForBounce: CGFloat = 100.0
    @State var opacity: CGFloat = 0
    @State var baseTime: Double
    @State var rot3D: Angle = Angle(degrees: 90)
    
    init(startTime: Double) {
        self.baseTime = startTime
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ProfileButton()
            .buttonStyle(.borderedProminent)
            .offset(x: offsetXForBounce, y: 0.0)
            .opacity(opacity)
            .animation(.linear(duration: 1.0), value: offsetXForBounce)
            .rotation3DEffect(rot3D, axis: (x: 0.0, y: 1.0, z: 0.0))
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + (0.8 + baseTime)) {
                withAnimation {
                    offsetXForBounce = -10
                    opacity = 1
                    rot3D = Angle(degrees: 0)
                }
            }
        }
    }
}

struct SettingsButton: View {
    
    var body: some View {
        BounceAnimationImageView(image: "studypomsettings", startTime: 0.5, width: 75, height: 75)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(loggedIn: .constant(true))
    }
}
