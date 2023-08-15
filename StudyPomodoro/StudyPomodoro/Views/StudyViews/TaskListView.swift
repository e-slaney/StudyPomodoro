//
//  TaskListView.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 8/11/23.
//

import SwiftUI

struct TaskListView: View {
    
    @State var taskList: [String] = ["task 1", "task 2", "task 3"]
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20.0)
                                .foregroundColor(.white)
                                .frame(width: 130, height: 40)
                                .shadow(radius: 3.0, x: 3.0)
                            Text("Add Task")
                                .font(.custom("Futura", size: 22))
                                .foregroundColor(Color(red: 1.0, green: 0.35, blue: 0.35))
                        }
                    }
                    Spacer()
                    ScrollView {
                        ForEach(0..<taskList.count, id: \.self) { i in
                            Text("\(taskList[i])")
                                .font(.custom("Futura", size: 18))
                        }
                    }
                }
                
            }
        }
        .padding(25)        
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
