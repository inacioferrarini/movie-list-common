import UIKit

/// Defines a contract that every `Module` must abide.
///
/// A Module is used to provide an initial `UIViewController`
/// for the module, as well an optional `UITabBarItem`.
///
/// If provided, the `UITabBarItem` can be used in the App's
/// UITabBar.
public protocol Module: AnyObject {

    var coordinator: Coordinator { get }
    
}
