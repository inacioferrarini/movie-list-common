import UIKit

/// Markup protocol used to designate that the object intentionally is capable to handle properly its own instantiation.
///
/// Note that this object differs from the regular `Instantiable` since it aims to mark Xib-based `ViewControllers`.
public protocol XibedViewController: Instantiable {}

public extension XibedViewController where Self: UIViewController {

    /// Instantiates the `ViewController` from a Xib with the same name,
    /// located in the same bundle as the class to be instantiated.
    ///
    /// - Returns: `Self`?
    static func instantiate() -> Self? {
        let className = String(describing: self)
        let bundle = Bundle(for: Self.self)
        return Self(nibName: className, bundle: bundle)
    }
    
}
