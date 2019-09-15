import Foundation

/// Markup protocol that allows any object to get
/// a string from a string table having the same name
public protocol Internationalizable: AnyObject {

    /// Returns a string designed by given `stringName`.
    ///
    /// - Parameters:
    ///   - stringName: The string to be retrieved.
    ///   - languageCode: The language code for the string file.
    /// - Returns: the string, or default value if not found.
    func string(_ stringName: String, languageCode: String) -> String

}

public extension Internationalizable {

    /// Returns a string designed by given `stringName`.
    ///
    /// - Parameters:
    ///   - stringName: The string to be retrieved.
    ///   - languageCode: The language code for the string file.
    /// - Returns: the string, or default value if not found.
    func string(_ stringName: String, languageCode: String) -> String {
        let bundle = Bundle(for: Self.self)
        let table = String(describing: type(of: self))
        return Strings.string(stringName, languageCode: languageCode, bundle: bundle, table: table)
    }

}
