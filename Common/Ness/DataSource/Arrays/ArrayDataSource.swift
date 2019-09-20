import UIKit

/// Array-based generic data source having elements of type `Type`.
open class ArrayDataSource<Type: Equatable>: NSObject {

    // MARK: - Properties

    /// `DataProvider` for this object.
    /// As ArrayDataSource is array-based, the data provider is array-based as well.
    open var dataProvider: ArrayDataProvider<Type>

    /// Block to be called whenever `refresh()` method is called.
    open var onRefresh: (() -> Void)?

    // MARK: - Initialization

    /// Inits with given `DataProvider`.
    ///
    /// - parameter dataProvider: The array-based Data provider.
    public init(with dataProvider: ArrayDataProvider<Type>) {
        self.dataProvider = dataProvider
    }

    // MARK: - Public Methods

    /// Propagates through `onRefresh` a refresh for interested objects.
    open func refresh() {
        if let dataProvider = self.dataProvider as? Refreshable {
            try? dataProvider.refresh()
        }
        self.onRefresh?()
    }

    /// Returns the object at the given `indexPath` row, if exists.
    ///
    /// - parameter at: The index path.
    ///
    /// - returns: The object of type `Type` at given `indexPath` row, or `nil` if not found.
    open func object(at indexPath: IndexPath) -> Type? {
        return dataProvider[indexPath]
    }

}
