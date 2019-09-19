import UIKit

/// Matrix-based generic data provider having elements of type `ElementType`.
///
/// Begin matrix-based allows this data provider to work both as single-sectioned (array)
/// and multi-sectiond (matrix) without changes.
///
/// Methods that receive a single section as parameter, will handle data as an array (rows only),
/// while methods that receive multiple sections as parameter will handle data as an matrix, begin
/// translatable as sections and rows.
open class ArrayDataProvider<ElementType: Equatable>: NSObject, DataProvider {

    // MARK: - Properties

    /// Stored sections and rows.
    public var elements: [[ElementType]]

    /// Section titles.
	public var titles: [String]?

    // MARK: - Initialization

    /// Inits with given elements.
    /// Data will be handled as a single section array.
    ///
    /// - parameter section: The section and its rows to be stored.
    public convenience init(section: [ElementType]) {
		self.init(sections: [section])
    }

    /// Inits with given elements.
    ///
    /// - parameter section: The sections and its rows to be stored.
	public convenience init(sections: [[ElementType]]) {
		self.init(sections: sections, titles: nil)
	}

    /// Inits with given elements and its section titles.
    ///
    ///  - parameter section: The sections and its rows to be stored.
    ///
    ///  - parameter titles: The titles for the given sections. If defined,
    /// 	must have the same length as sections.
	public init(sections: [[ElementType]], titles: [String]?) {
		self.elements = sections
		self.titles = titles
	}

    // MARK: - Data Provider Implementation

    /// Returns the element of given `ElementType` at given `indexPath`, if exists.
    ///
    /// - parameter indexPath: IndexPath to get object. If the given `indexPath.section`
    /// is greater than the amount of stored sections, or if the given `indexPath.row`
    /// is greater than the amount of rows for given section, returns nil.
    ///
    /// - returns `ElementType`?.
    public subscript(_ indexPath: IndexPath) -> ElementType? {
        let section = indexPath.section
        let row = indexPath.row
        guard section < self.numberOfSections() else { return nil }
        guard row < self.numberOfItems(in: section) else { return nil }
        return self.elements[section][row]
    }

    /// Returns the IndexPath for the given element, if found.
    ///
    /// - parameter element: Object to search.
    ///
    /// - returns: IndexPath.
	public func path(for element: ElementType) -> IndexPath? {
		var indexPath: IndexPath?
		for section in 0..<numberOfSections() {
            guard let row = self.elements[section].firstIndex(of: element) else { continue }
			indexPath = IndexPath(row: row, section: section)
			break
		}
		return indexPath
	}

    /// Returns the numbers of stored sections.
    ///
    /// - returns: Int.
    public func numberOfSections() -> Int {
        return self.elements.count
    }

    /// Returns the number of elements in the given section.
    ///
    ///  - remarks: If given section does not exists, returns 0.
    ///
    ///  - parameter section: The section to be inquired about how much rows it has.
    ///
    ///  - returns: Int.
	public func numberOfItems(in section: Int) -> Int {
		guard section < self.numberOfSections() else { return 0 }
		return self.elements[section].count
	}

    /// Returns the title for a given section.
    ///
    /// - parameter section: Desired section.
    ///
    /// - returns: String?
	public func title(section: Int) -> String? {
		guard section < self.numberOfSections() else { return nil }
		guard section < self.titles?.count ?? 0 else { return nil }
		return self.titles?[section]
	}

}