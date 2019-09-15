import Foundation

public struct Strings {

    public static func string(_ stringName: String, languageCode: String, bundle: Bundle, table: String? = nil, `default`: String = "Not Found") -> String {
        if let path = bundle.path(forResource: languageCode, ofType: "lproj"),
            let languageBundle = Bundle(path: path) {
            return languageBundle.localizedString(forKey: stringName, value: stringName, table: table)
        }
        return `default`
    }
    
}
