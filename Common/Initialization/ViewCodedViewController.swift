import UIKit

/// Markup protocol used to designate that the object intentionally is capable to handle properly its own instantiation.
///
/// Note that this object differs from the regular `Instantiable` since it aims to mark ViewCode-based `ViewController`.
public protocol ViewCodedViewController: Instantiable {}

public extension ViewCodedViewController where Self: UIViewController {

    /// Returns an instance of the given object.
    /// Since objects can fail to instantiate, it is safer to assume they may fail.
    ///
    /// - Returns: Instantiated object
    static func instantiate() -> Self? {
        return Self()
    }

}
