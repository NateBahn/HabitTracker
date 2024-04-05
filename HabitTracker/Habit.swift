import Foundation
import Observation
import SwiftData
import SwiftUI

@Model
class Habit: Equatable, Hashable, Identifiable{
    var id = UUID()
    
    var name: String
    var details: String
    var completedDates: DateTracker
    var priority: Int


    
    init(name: String, details: String, priority: Int) {
        self.id = UUID()
        self.name = name
        self.details = details
        self.priority = priority
        self.completedDates = DateTracker()
    }
    
    
    //Implementations for Equatable, Hashable protocalls
    static func == (lhs: Habit, rhs: Habit) -> Bool {
        return lhs.id == rhs.id
      }

      func hash(into hasher: inout Hasher) {
          hasher.combine(name)
          hasher.combine(details)
          hasher.combine(priority)
      }
    //var vision: String
    //var currentHabit: Bool
    
        //static var testHabit =  Habit(name: "Brush Teeth", details: "My goal is too have clean teeth", priority: 1)
    
//    enum CodingKeys: String, CodingKey {
//        case _id = "id"
//        case _name = "name"
//        case _details = "details"
//        case _completedDates = "completedDates"
//    }
}
