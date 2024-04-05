//import Foundation
//import Observation
//
//import SwiftData
//
//@Model
//class Habits {
//    var items = [Habit]()
////    {
////        didSet{
////            if let encoded = try? JSONEncoder().encode(items)
////            {
////                UserDefaults.standard.set(encoded, forKey: "Habits")
////                print("Didset on Habits ran successfully")
////            }
////        }   
////    }
//    
//    
//
//    
////    init() {
////        if let data = UserDefaults.standard.data(forKey: "Habits"){
////            print("Successfully retrieved data")
////            if let habits = try? JSONDecoder().decode([Habit].self, from: data){
////                    items = habits
////                    return
////            }
////        }
////        
////        items = []
////        return
////    }
//}
