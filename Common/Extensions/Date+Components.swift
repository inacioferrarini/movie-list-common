import Foundation

public extension Date {

    /// Returns the 'Year' of the current Date.
    var year: Int {
        let calendar = Calendar.current
        return calendar.component(.year, from: self)
    }

}
