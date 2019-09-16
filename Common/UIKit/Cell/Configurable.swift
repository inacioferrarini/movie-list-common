import Foundation

/// Adds the capability to be configured using the given value.
public protocol Configurable {

    associatedtype ValueType

    /// Setups the object with the given value.
    ///
    /// - parameter with: The value to setup with.
    mutating func setup(with value: ValueType)

}
