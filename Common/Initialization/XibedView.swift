import UIKit

/// Markup protocol used to designate that the object intentionally is capable to handle properly its own instantiation.
///
/// Note that this object differs from the regular `Instantiable` since it aims to mark Xib-based `View`.
public protocol XibedView: Instantiable {}

public extension XibedView where Self: UIView {
    
    /// Instantiates the `View` from a Xib with the same name,
    /// located in the same bundle as the class to be instantiated.
    ///
    /// - Returns: `Self`?
    static func instantiate() -> Self? {
        let className = String(describing: self)
        let bundle = Bundle(for: Self.self)
        return bundle.loadNibNamed(className, owner: nil, options: nil)?.first as? Self
    }
    
}
