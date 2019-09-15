import UIKit

/// Markup protocol used to designate that the object intentionally is capable to handle properly its own instantiation.
///
/// Note that this object differs from the regular `Instantiable` since it aims to mark Storyboard-based `View`.
public protocol Storyboarded: Instantiable {
    
    /// Instantiates the `ViewController` from the Storyboard with the given name,
    /// located in the same bundle as the class to be instantiated.
    ///
    /// - Parameter storyboard: The storyboard to be instantiated.
    /// - Returns: `Self`?
    static func instantiate(from storyboard: String) -> Self?
    
}

public extension Storyboarded where Self: UIViewController {

    /// Instantiates the `ViewController` from a Storyboard with the given name,
    /// located in the same bundle as the class to be instantiated.
    ///
    /// - Returns: `Self`?
    static func instantiate() -> Self? {
        return self.instantiate(from: String(describing: self))
    }
    
    /// Instantiates the `ViewController` from a Storyboard with the same name,
    /// located in the same bundle as the class to be instantiated.
    ///
    /// - Returns: `Self`?
    static func instantiate(from storyboard: String) -> Self? {
        let className = String(describing: self)
        let bundle = Bundle(for: Self.self)
        let storyboard = UIStoryboard(name: storyboard, bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: className) as? Self
    }
    
}
