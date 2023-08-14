//
//  HomeView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 8/11/23.
//

import SwiftUI

struct HomeView: View {
    private var quote: Quote = getQuote()
    @State var fadingQuote = false
    @State var fadingAuthor = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 1.0, green: 0.78, blue: 0.76)
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            BounceAnimationView(text: "Study", startTime: 0.0)
                            BounceAnimationView(text: "Pomodoro", startTime: 0.0)
                        }
                        .foregroundColor(.red)
                        .shadow(radius: 3.0, x: 3.0, y: 3.0)
                        Spacer()
                        VStack {
                            NavigationLink {
                                EmptyView()
                            } label: {
                                SettingsButton()
                                    .padding(.bottom, 60)
                            }
                        }
                    }
                    .padding([.leading, .trailing])
    
                    Spacer()
                    NavigationLink {
                        StudyView()
                    } label: {
                        StudyButton()
                            .padding(.leading)
                    }
                    
                    NavigationLink {
                        EmptyView()
                    } label: {
                        StatisticsButton()
                            .padding(.leading)
                    }
                    
                    NavigationLink {
                        EmptyView()
                    } label: {
                        ProfileButton()
                            .padding(.leading)
                    }
                    
                    Spacer()
                    Text("\(quote.text)")
                        .font(.custom("Futura", size: 22))
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                    HStack {
                        Spacer()
                        Text("\(quote.author)")
                            .font(.custom("Futura", size: 20))
                            .padding(.trailing, 50)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct StudyButton: View {
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(.red)
                .frame(height: 60)
                .shadow(radius: 3.0, x: 3.0, y: 3.0)
            HStack {
                Text("Study")
                    .foregroundColor(.white)
                Image(systemName: "deskclock.fill")
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .font(.custom("Futura", size: 24))
        }
        .frame(width: 180)
    }
}

struct StatisticsButton: View {
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(.red)
                .frame(height: 60)
                .shadow(radius: 3.0, x: 3.0, y: 3.0)
            HStack {
                Text("Statistics")
                    .foregroundColor(.white)
                Image(systemName: "chart.bar.fill")
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .font(.custom("Futura", size: 24))
        }
        .frame(width: 180)
    }
}

struct ProfileButton: View {
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(.red)
                .frame(height: 60)
                .shadow(radius: 3.0, x: 3.0, y: 3.0)
            HStack() {
                Text("Profile")
                    .foregroundColor(.white)
                Image(systemName: "person.crop.circle.fill")
                    .foregroundColor(.white)
                Spacer()
            }
            .font(.custom("Futura", size: 24))
            .padding()
        }
        .frame(width: 180)
    }
}

struct SettingsButton: View {
    
    var body: some View {
        Image("studypomsettings")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 75, height: 75)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
