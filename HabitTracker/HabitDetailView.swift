import SwiftData
import SwiftUI


struct HabitDetailView: View {
    var habit: Habit
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    func deleteHabit(){
        modelContext.delete(habit)
        dismiss()
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    Form{
                        
                        
                        Section("Details:"){
                            
                            Text(habit.details)
                                .fixedSize(horizontal: false, vertical: true)
                            
                        }
                        .padding(.horizontal)
                        
                        Section("Current Streak"){
                            //Make this into actual streak
                            Text(String(habit.completedDates.completionCount))
                        }
                        Section("Total Completed"){
                        
                            Text(String(habit.completedDates.completionCount))
                        }
                    }
                }
            }
            .alert("Delete Habit \"\(habit.name)\"", isPresented: $showingDeleteAlert) {
                Button("Delete", role: .destructive, action: deleteHabit)
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Are you sure?")
            }
            .toolbar {
                Button("Delete this habit", systemImage: "trash") {
                    showingDeleteAlert = true
                }
            }
            .navigationTitle(habit.name)
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Habit.self, configurations: config)

    let habit = Habit(name: "Brush Teeth", details: "Yes indeed", priority: 1)
    return HabitDetailView(habit: habit)
        .modelContainer(container)
}
