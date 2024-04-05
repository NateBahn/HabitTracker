import SwiftUI

struct DateTracker: Codable {
    
    var completedDates = [Date]()
    
    var completeToday: Bool {
        guard let recentComplete = lastCompletedDate else {
            return false
        }
        
        return Calendar.current.startOfDay(for: recentComplete) == Calendar.current.startOfDay(for: Date.now)
    }
    
    var completionCount: Int {
        completedDates.count
    }
    
    var lastCompletedDate: Date? {
        completedDates.last
    }
    
    var currentStreak: Int {
        10
    }
    
    var percentCompletedToday: Double {
        0.3
    }
    
    
    mutating func markComplete() -> (){
        if !completeToday{
            completedDates.append(Date.now)
        }
        else{
            completedDates.removeLast()
        }
    }
}
