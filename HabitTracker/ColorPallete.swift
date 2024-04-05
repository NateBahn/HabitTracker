import Foundation
import SwiftUI

struct Palette  {
    
    static let lightGreen = Color(red: 100/255.0, green: 225/255.0, blue: 220/255.0).opacity(0.5)

    
    static let creamyWhite = Color(red: 255/255.0, green: 253/255.0, blue: 247/255.0)
    
    static let warmTaupe = Color(red: 184/255.0, green: 160/255.0, blue: 143/255.0)
    
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
    
    
    static let colorScheme2 =  ["BB4430", "2A1E5C", "77B6EA", "FFC07F"]// "3F612D", "2C2A4A"]
    
    static let colorScheme3 =  ["EAE0CC", "C9ADA1", "A0A083", "798478", "4D6A6D", "511730"]
    
    static let colorScheme1 =  ["279AF1", "F71735", "41EAD4", "824670", "FF9F1C", "5FAD56"]
    
    static var colors1: [Color]{
        return colorScheme1.map{Color(UIColor(hex: $0)!)}
    }
    
    static var colors2: [Color]{
        return colorScheme2.map{Color(UIColor(hex: $0)!)}
    }
    
    static var colors3: [Color]{
        return colorScheme3.map{Color(UIColor(hex: $0)!)}
    }
    
    static var colors4: [Color]{
        return [.red, .yellow, .green, .blue, .purple, .teal]
    }

    
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
            let hexColor = String(hex[...])

          
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                   // a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: 1)
                    return
            }
        

        return nil
    }
}
