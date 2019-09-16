import UIKit

/// Array-based UICollectionView data source having elements of type `Type` and using `ConfigurableCollectionViewCell`.
open class CollectionViewArrayDataSource<CellType: UICollectionViewCell, Type: Equatable>: ArrayDataSource<Type>, UICollectionViewDataSource
    where CellType: Configurable {
    
    // MARK: - Properties
    
    /// TableView that owns this DataSource.
    public let collectionView: UICollectionView
    
    /// Returns the Reuse Identifier for a Cell at the given `IndexPath`.
    let reuseIdentifier: ((IndexPath) -> (String))

    // MARK: - Initialization
    
    /// Inits the DataSource providing an UICollectionView and its objects.
    /// Assumes the ReuseIdentifier will have the same name as `CellType` type.
    ///
    /// - parameter for: The target UICollectionView.
    ///
    /// - parameter dataProvider: The array-based Data provider.
    public convenience init(for collectionView: UICollectionView, with dataProvider: ArrayDataProvider<Type>) {
        let reuseIdentifier = { (indexPath: IndexPath) -> String in
            return CellType.simpleClassName()
        }
        self.init(for: collectionView,
                  reuseIdentifier: reuseIdentifier,
                  with: dataProvider)
    }
    
    /// Inits the DataSource providing an UICollectionView and its objects.
    ///
    /// - parameter for: The target UICollectionView.
    ///
    /// - parameter reuseIdentifier: Block used to define the Ruse Identifier based on the given IndexPath.
    ///
    /// - parameter dataProvider: The array-based Data provider.
    public required init(for collectionView: UICollectionView,
                         reuseIdentifier: @escaping ((IndexPath) -> (String)),
                         with dataProvider: ArrayDataProvider<Type>) {
        self.collectionView = collectionView
        self.reuseIdentifier = reuseIdentifier
        super.init(with: dataProvider)
    }

    // MARK: - Public Methods
    
    /// Propagates through `onRefresh` a refresh for interested objects and also
    /// calls `reloadData` on `tableView`.
    open override func refresh() {
        super.refresh()
        self.collectionView.reloadData()
    }

    // MARK: - Collection View Data Source
    
    /// Returns the number of items in its only section. The number of items always matches the number of contained objects.
    ///
    /// - parameter collectionView: The target UICollectionView.
    ///
    /// - parameter section: The desired sections. Values different than `0` will result in `0` being returned.
    ///
    /// - returns: number of objects.
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataProvider.numberOfItems(in: section)
    }
    
    /// Returns the number of items in its only section. The number of rows always matches the number of contained objects.
    ///
    /// - parameter collectionView: The target UICollectionView.
    ///
    /// - parameter cellForItemAt: The indexPath for the given object, or `nil` if not found.
    ///
    /// - returns: number of objects.
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = self.reuseIdentifier(indexPath)
        guard var cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CellType else { return UICollectionViewCell() }
        
        if let value = self.dataProvider[indexPath] as? CellType.ValueType {
            cell.setup(with: value)
        }
        
        return cell
    }

}
