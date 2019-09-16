import UIKit

/// Array-based UITableView data source having elements of type `Type` and using `ConfigurableTableViewCell`.
open class TableViewArrayDataSource<CellType: UITableViewCell, Type: Equatable>: ArrayDataSource<Type>, UITableViewDataSource
    where CellType: Configurable {

    // MARK: - Properties

    /// TableView that owns this DataSource.
    public let tableView: UITableView

    /// Returns the Reuse Identifier for a Cell at the given `IndexPath`.
    let reuseIdentifier: ((IndexPath) -> (String))

    // MARK: - Initialization

    /// Inits the DataSource providing an UITableView and its objects.
    /// Assumes the ReuseIdentifier will have the same name as `CellType` type.
    ///
    /// - parameter for: The target UITableView.
    ///
    /// - parameter dataProvider: The array-based Data provider.
    public convenience init(for tableView: UITableView, with dataProvider: ArrayDataProvider<Type>) {
        let reuseIdentifier = { (indexPath: IndexPath) -> String in
            return CellType.simpleClassName()
        }
        self.init(for: tableView,
                  reuseIdentifier: reuseIdentifier,
                  with: dataProvider)
    }

    /// Inits the DataSource providing an UITableView and its objects.
    ///
    /// - parameter for: The target UITableView.
    ///
    /// - parameter reuseIdentifier: Block used to define the Ruse Identifier based on the given IndexPath.
    ///
    /// - parameter dataProvider: The array-based Data provider.
    public required init(for tableView: UITableView,
                         reuseIdentifier: @escaping ((IndexPath) -> (String)),
                         with dataProvider: ArrayDataProvider<Type>) {
        self.tableView = tableView
        self.reuseIdentifier = reuseIdentifier
        super.init(with: dataProvider)
    }

    // MARK: - Public Methods

    /// Propagates through `onRefresh` a refresh for interested objects and also
    /// calls `reloadData` on `tableView`.
    open override func refresh() {
        super.refresh()
        self.tableView.reloadData()
    }

    // MARK: - Table View Data Source

    /// Returns the number of rows in its only section. The number of rows always matches the number of contained objects.
    ///
    /// - parameter tableView: The target UITableView.
    ///
    /// - parameter section: The desired sections. Values different than `0` will result in `0` being returned.
    ///
    /// - returns: number of objects.
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataProvider.numberOfItems(in: section)
    }

    /// Returns the number of rows in its only section. The number of rows always matches the number of contained objects.
    ///
    /// - parameter tableView: The target UITableView.
    ///
    /// - parameter cellForRowAt: The indexPath for the given object, or `nil` if not found.
    ///
    /// - returns: number of objects.
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = self.reuseIdentifier(indexPath)
        guard var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CellType else { return UITableViewCell() }

        if let value = self.dataProvider[indexPath] as? CellType.ValueType {
            cell.setup(with: value)
        }

        return cell
    }

}
