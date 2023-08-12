//
//  HomeView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 8/11/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 1.0, green: 0.78, blue: 0.76)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        SettingsButton()
                    }
                    Spacer()
                    NavigationLink {
                        StudyView()
                    } label: {
                        StudyButton()
                    }
                    
                    StatisticsButton()
                    
                    ProfileButton()
                    
                    Spacer()
                }
            }
            
        }
    }
}

struct SampleView: View {
    
    var body: some View {
        VStack {
            Text("Sample")
            Text("Sample")
        }
    }
}

struct StudyButton: View {
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(.red)
                .frame(height: 60)
                .shadow(radius: 3.0, x: 3.0)
            HStack {
                Text("Study")
                    .foregroundColor(.white)
                Image(systemName: "deskclock.fill")
                    .foregroundColor(.white)
            }
            .font(.custom("Futura", size: 32))
        }
        .padding(.leading, 75)
        .padding(.trailing, 75)
    }
}

struct StatisticsButton: View {
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(.red)
                .frame(height: 60)
                .shadow(radius: 3.0, x: 3.0)
            HStack {
                Text("Statistics")
                    .foregroundColor(.white)
                Image(systemName: "chart.bar.fill")
                    .foregroundColor(.white)
            }
            .font(.custom("Futura", size: 32))
        }
        .padding(.leading, 75)
        .padding(.trailing, 75)
    }
}

struct ProfileButton: View {
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(.red)
                .frame(height: 60)
                .shadow(radius: 3.0, x: 3.0)
            HStack {
                Text("Profile")
                    .foregroundColor(.white)
                Image(systemName: "person.crop.circle.fill")
                    .foregroundColor(.white)
            }
            .font(.custom("Futura", size: 32))
        }
        .padding(.leading, 75)
        .padding(.trailing, 75)
    }
}

struct SettingsButton: View {
    
    var body: some View {
        Image(systemName: "gearshape.fill")
            .foregroundColor(.white)
            .font(.custom("ChalkboardSE", size: 32))
            .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
