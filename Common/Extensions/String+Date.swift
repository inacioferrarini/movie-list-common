import Foundation

public extension String {
    
    /// Converts the data stored as String to `Date`
    /// - Parameter format: The date format to be used. Defaults to `yyyy-MM-dd`
    func toDate(withFormat format: String = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
    
}
