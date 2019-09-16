import Foundation

/// Adds useful capabilities to NSObject.
extension NSObject {
    
    /// Extracts the simple class name of a given type.
    /// As in Swift the types names are composed with the modules they are located,
    /// this method extracts the type name without the module name.
    ///
    /// - returns: The simple class name of the type
    ///
    /// ### Usage Example: ###
    /// ````
    /// let name = "".simpleClassName() // returns "NSString"
    /// ````
    open class func simpleClassName() -> String {
        guard let className = object_getClass(self) else { return "" }
        let fullClassName: String = NSStringFromClass(className)
        let classNameComponents = fullClassName.split {$0 == "."}.map(String.init)
        return classNameComponents.last!
    }
    
}
