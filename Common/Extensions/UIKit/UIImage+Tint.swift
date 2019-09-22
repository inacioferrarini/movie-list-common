import UIKit

extension UIImage {

    /// Returns a new image created by applying the given tint to the original image.
    /// The returned image will have rendering mode `RenderingMode.alwaysOriginal`.
    ///
    /// - Parameter color: The `UIColor` to be used as tint.
    /// - Returns: the created `UIImage`.
    public func tint(with color: UIColor) -> UIImage? {
        var image: UIImage? = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()

        image?.draw(in: CGRect(origin: .zero, size: size))
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image?.withRenderingMode(.alwaysOriginal)
    }

}
