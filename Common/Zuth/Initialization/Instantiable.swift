import UIKit

/// Markup protocol used to designate that the object intentionally is capable to handle properly its own instantiation.
public protocol Instantiable {
    
    /// Returns an instance of the given object.
    /// Since objects can fail to instantiate, it is safer to assume they may fail.
    ///
    /// - Returns: Instantiated object
    static func instantiate() -> Self?
    
}
