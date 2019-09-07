import UIKit

/// Defines a contract that every `Coordinator` must abide.
///
/// Essentially, a `Coordinator` is responsible to orchestrate
/// a navigation flow between different ViewControllers in order
/// to complete a given task.
///
/// A `Coordinator` can be composed of other `Coordinators`.
/// In this context, they will be called `SubCoordinators`.
public protocol Coordinator: AnyObject {
    
    /// Starts the `Coordinator`
    func start()
    
}
