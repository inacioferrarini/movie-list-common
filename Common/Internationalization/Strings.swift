import Foundation

/// Ease the usage of strings from different String tables.
public struct Strings {

    /// Returns the String that matches the given `stringName` in the given `table` for the given `languageCode`.
    /// If no matching string is retrieved, `default` will be returned.
    ///
    /// - Parameters:
    ///   - stringName: The name of the string key to be retrieved.
    ///   - languageCode: The code for the language. en-US, pt-BR, etc.
    ///   - bundle: The bundle where the given string table is located.
    ///   - table: The string file where the `stringName` is located.
    ///   - `default`: A string to be returned if a matching string cannot be found.
    /// - Returns: The required string or `default`.
    public static func string(_ stringName: String, languageCode: String, bundle: Bundle, table: String? = nil, `default`: String = "Not Found") -> String {
        if let path = bundle.path(forResource: languageCode, ofType: "lproj"),
            let languageBundle = Bundle(path: path) {
            return languageBundle.localizedString(forKey: stringName, value: `default`, table: table)
        }
        return `default`
    }
    
}
