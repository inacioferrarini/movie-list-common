import Foundation

public protocol Internationalizable: AnyObject {

    func string(_ stringName: String, languageCode: String) -> String

}

public extension Internationalizable {

    func string(_ stringName: String, languageCode: String) -> String {
        let bundle = Bundle(for: Self.self)
        let table = String(describing: type(of: self))
        return Strings.string(stringName, languageCode: languageCode, bundle: bundle, table: table)
    }

}
