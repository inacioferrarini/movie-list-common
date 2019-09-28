//    The MIT License (MIT)
//
//    Copyright (c) 2019 Inácio Ferrarini
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.
//

import UIKit

private class PrivateAssets {}

///
/// Assets for the project.
/// Provides an easy, global access to the project resources.
///
public struct Assets {

    ///
    /// Colors from the asset catalog
    ///
    public struct Colors {

        ///
        /// TabBar colors
        ///
        public struct TabBar {
            ///
            /// Color to be used for background
            ///
            public static let backgroundColor = color("TabBarBackgroundColor")
            
            ///
            /// Color to be used for active tab bar item color
            ///
            public static let selectedTextColor = color("TabBarSelectedTextColor")
            
            ///
            /// Color to be used for default tab bar item color
            ///
            public static let unselectedTextColor = color("TabBarUnselectedTextColor")
            
            ///
            /// Color to be used for active tab bar item icon
            ///
            public static let selectedIconColor = color("TabBarSelectedIconColor")
            
            ///
            /// Color to be used for default tab bar item icon
            ///
            public static let unselectedIconColor = color("TabBarUnselectedIconColor")
        }
        
        ///
        /// NavigationBar colors
        ///
        public struct NavigationBar {
            
            ///
            /// Color to be used for background
            ///
            public static let backgroundColor = color("NavigationBarBackgroundColor")
            
            ///
            /// Color to be used for text background
            ///
            public static let textBackgroundColor = color("NavigationBarTextBackgroundColor")
            
            ///
            /// Color to be used for title
            ///
            public static let titleColor = color("NavigationBarTitleTextColor")
            
            ///
            /// Color to be used for icons
            ///
            public static let iconColor = color("NavigationBarIconColor")
        }

    }

    ///
    /// Icons from the asset catalog
    ///
    public struct Icons {

        private static let selectedIconTintColor = Assets.Colors.TabBar.selectedIconColor ?? UIColor.blue

        ///
        /// Icons for each App Module
        ///
        public struct Modules {
            
            ///
            /// Icon to be used for favorite module
            ///
            public static let favorite = image("FavoriteMoviesIcon", tint: selectedIconTintColor)
            
            ///
            /// Icon to be used for catalog module
            ///
            public static let catalog = image("MoviesCatalogIcon", tint: selectedIconTintColor)
        }

        ///
        /// Icons for status
        public struct Status {
            
            ///
            /// Icon to be used for checked status
            ///
            public static let check = image("CheckmarkIcon")
            
            ///
            /// Icon to be used for favorite movies
            ///
            public static let favoriteFull = image("FavoriteFullIcon")
            
            ///
            /// Icon to be used for non-favorite movies
            ///
            public static let favoriteGray = image("FavoriteGrayIcon")
        }

        ///
        /// Icons for each App action
        ///
        public struct Actions {
            ///
            /// Icon for filter action
            ///
            public static let filter = image("FilterIcon")
            
            ///
            /// Icon for search action
            ///
            public static let search = image("SearchIcon")
        }

        static func errorIcon(with size: CGSize) -> UIImage? {
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            if let cgContext = UIGraphicsGetCurrentContext() {
                let frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
                UIColor(hex: "#951315")?.setFill()
                cgContext.fillEllipse(in: frame)

                cgContext.setLineWidth(8.0)
                UIColor.white.setStroke()

                cgContext.move(to: CGPoint(x: size.width/4, y: size.height/4))
                cgContext.addLine(to: CGPoint(x: size.width/4 * 3, y: size.height/4 * 3))
                cgContext.strokePath()

                cgContext.move(to: CGPoint(x: size.width/4 * 3, y: size.height/4))
                cgContext.addLine(to: CGPoint(x: size.width/4, y: size.height/4 * 3))
                cgContext.strokePath()
            }

            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return image
        }

    }

    private static func color(_ colorName: String) -> UIColor? {
        return UIColor(named: colorName, in: Bundle(for: PrivateAssets.self), compatibleWith: nil)
    }

    private static func image(_ imageName: String) -> UIImage? {
        return UIImage(named: imageName, in: Bundle(for: PrivateAssets.self), compatibleWith: nil)
    }

    private static func image(_ imageName: String, tint: UIColor) -> UIImage? {
        return image(imageName)?.tint(with: tint)
    }

}
