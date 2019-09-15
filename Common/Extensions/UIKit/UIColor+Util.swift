import UIKit

extension UIColor {
    
    /// Creates an `UIColor` from the given hexcode.
    /// The hex code can be either 6 (RGB), 7 (#RGB) or 8 (RGBA) or 9 (#RGBA) characters long.
    ///
    /// - Parameter hex: The hexadecimal color code. `nil` will be returned if the given code does cannot be mapped to a proper color.
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        var startIndex = 0
        if hex.hasPrefix("#") {
            startIndex = 1
        }
        
        let start = hex.index(hex.startIndex, offsetBy: startIndex)

        var hexColor = String(hex[start...])

        if hexColor.count == 6 {
            hexColor += "FF"
        }

        if hexColor.count == 8 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0

            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255

                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }

        return nil
    }
    
}
