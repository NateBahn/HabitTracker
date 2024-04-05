/*
 Next Steps:
 3. Pick 6 color palette
 4. Weekly display
 5. Add Streak logic
 6. Add Steps to Habit Details
 7. Add time window to Habit Details
 */


/*
MVP List:
 1. Make Habits editable and deletable
 2. Make Habits list order consistent and editable
 3.
 */


import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var isComplete = true
    
    @Query(sort: [SortDescriptor(\Habit.priority),SortDescriptor(\Habit.name)]) var habits: [Habit]
    @Environment(\.modelContext) var modelContext
    
    
    
    
    var body: some View {
        NavigationStack {
            VStack{
                
                    ForEach(habits, id: \.id) {habit in
                        HabitView(habit: habit)
                    
                }
            Spacer()
                VStack{
                    HStack{
                        
                        ForEach(Palette.colors3, id: \.self){color in
                            
                            Image(systemName: "square.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(color)
                            
                        }
                    }
                
                    }
                 
                
               
              
            }
            
            .toolbar{
                ToolbarItem{
                    NavigationLink{
                        AddHabitView()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .disabled(habits.count >= 6)
                }
                  
                
                }
         
            .navigationTitle("Habit Tracker")
            .background(Palette.creamyWhite)
            //.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            Spacer()
                
            
          
        }
    }
}
#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Habit.self, configurations: config)

    for i in 1..<7 {
        let habit = Habit(name: "habit \(i)", details: "detail \(i)", priority: i)
        container.mainContext.insert(habit)
    }

    return ContentView()
        .modelContainer(container)
}
