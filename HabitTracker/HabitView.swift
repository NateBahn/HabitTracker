import SwiftData
import SwiftUI

struct HabitView: View {
    var habit: Habit
    
    
 
    var body: some View {
        NavigationLink(){
            HabitDetailView(habit: habit)
        }label: {
            HStack{
                Text(habit.name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
                Button{
                    habit.completedDates.markComplete()
                }label:{
                    VStack{
                        Image(systemName: habit.completedDates.completeToday ? "checkmark": "square")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45 )
                    
                    }
                    
                }        }
            .foregroundColor(.secondary)
            .padding()
            .frame(width: .infinity, height: 75)
            .background(habit.completedDates.completeToday ? Palette.warmTaupe : Palette.warmTaupe.opacity(0.2))
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal)
        }
    }
}

//#Preview {
//     let config = ModelConfiguration(isStoredInMemoryOnly: true)
//     let container = try! ModelContainer(for: Habit.self, configurations: config)
//    let habit = Habit(name: "Brush Teeth", details: "Yes indeed", color: .white)
//    return HabitView(habit: habit)
//        .modelContainer(container)
//}
