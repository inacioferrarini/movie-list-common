import Foundation

/// Provides data for a DataSource. Its provided objects will be of type `ValueType`.
///
/// Its objects shall not be accessed directly, granting its usage throught its methods,
/// allowing better compatibility among different kinds of data providers.
public protocol DataProvider {

    /// The type of the provided object.
    associatedtype ValueType

    /// The type for the index type.
	associatedtype IndexType

    /// The type for the section title.
	associatedtype SectionTitleType

    /// Returns the object of given `ValueType` at given `indexPath`, if exists.
    ///
    /// - parameter indexPath: IndexPath to get object.
    ///
    /// - returns `ValueType`.
    subscript(_ index: IndexType) -> ValueType? { get }

    /// Returns the IndexPath for the given object, if found.
    ///
    /// - parameter value: Object to search.
    ///
    /// - returns: IndexPath.
    func path(for value: ValueType) -> IndexType?

    /// Returns the numbers of provided sections.
    ///
    /// For one-dimentional arrays, will return 1.
    ///
    /// - returns: Int.
    func numberOfSections() -> Int

    /// Returns the number of objects in the given section.
    ///
    /// If given section does not exists, returns 0.
    ///
    /// - parameter section: The section to be inquired about how much provided objects it has.
    ///
    /// - returns: Int.
    func numberOfItems(in section: Int) -> Int

    /// Returns the title for a given section.
	func title(section: Int) -> SectionTitleType?

}
