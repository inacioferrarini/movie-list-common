import Foundation

/// The capability some `DataProviders` has to be refreshable.
public protocol Refreshable {

    /// Refreshes the `DataProvider` object.
    func refresh() throws

}
