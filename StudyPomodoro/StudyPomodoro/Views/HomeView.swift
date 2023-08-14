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
                        StudyButton()
                            .padding(.leading)
                    }
                    .padding(.bottom)
                    
                    NavigationLink {
                        EmptyView()
                    } label: {
                        StatisticsButton()
                            .padding(.leading)
                    }
                    .padding(.bottom)
                    
                    NavigationLink {
                        EmptyView()
                    } label: {
                        ProfileButton()
                            .padding(.leading)
                    }
                    .padding(.bottom)
                    
                    Spacer()
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
                    
                    Spacer()
                }
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
