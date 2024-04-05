//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Marissa Almoslino on 3/13/24.
//

import SwiftUI

struct AddHabitView: View {
    
    @State private var name = ""
    @State private var details = ""
    @State private var priority = 0
    let hours = Array(0...23)
    
    

    
    @Environment(\.modelContext) var modelContext
    
    @Environment(\.dismiss) var dismiss
    
    func formatHour(_ hour: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ha"
        
        let date = Calendar.current.date(bySettingHour: hour, minute: 0, second: 0, of: Date())!
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Habit Name", text: $name)
                
                TextEditor(text: $details)
               
                Picker("Start Hour", selection: $priority) {
                             ForEach(hours, id: \.self) { hour in
                                 Text(formatHour(hour))
                             }
                         }
                         //.pickerStyle(WheelPickerStyle())
              
            }
            .navigationTitle("New Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button("Save"){
                    modelContext.insert(Habit(name:name, details: details, priority: priority))
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddHabitView()
}

