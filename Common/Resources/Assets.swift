import UIKit

private class PrivateAssets {}

/// Assets for the project.
/// Provides an easy, global access to the project resources.
public struct Assets {
    
    /// Colors from the asset catalog
    public struct Colors {
        
        /// TabBar colors
        public struct TabBar {
            /// Color to be used for background
            public static let backgroundColor = color("TabBarBackgroundColor")
            /// Color to be used for active tab bar item color
            public static let selectedTextColor = color("TabBarSelectedTextColor")
            /// Color to be used for default tab bar item color
            public static let unselectedTextColor = color("TabBarUnselectedTextColor")
            /// Color to be used for active tab bar item icon
            public static let selectedIconColor = color("TabBarSelectedIconColor")
            /// Color to be used for default tab bar item icon
            public static let unselectedIconColor = color("TabBarUnselectedIconColor")
        }
        
        /// NavigationBar colors
        public struct NavigationBar {
            /// Color to be used for background
            public static let backgroundColor = color("NavigationBarBackgroundColor")
            /// Color to be used for title
            public static let titleColor = color("NavigationBarTitleTextColor")
            /// Color to be used for icons
            public static let iconColor = color("NavigationBarIconColor")
        }

    }
    
    /// Icons from the asset catalog
    public struct Icons {
        
        private static let selectedIconTintColor = Assets.Colors.TabBar.selectedIconColor ?? UIColor.blue
        
        /// Icons for each App Module
        public struct Modules {
            /// Icon to be used for favorite module
            public static let favorite = image("FavoriteMoviesIcon", tint: selectedIconTintColor)
            /// Icon to be used for catalog module
            public static let catalog = image("MoviesCatalogIcon", tint: selectedIconTintColor)
        }

        /// Icon to be used for checked status
        public static let check = image("check_icon")
        /// Icon to be used for favorite movies
        public static let favoriteFull = image("favorite_full_icon")
        /// Icon to be used for non-favorite movies
        public static let favoriteGray = image("favorite_gray_icon")
        
        /// Icons for each App action
        public struct Actions {
            /// Icon for filter action
            public static let filter = image("FilterIcon")
            /// Icon for search action
            public static let search = image("search_icon")
        }

    }
    
    private static func color(_ colorName: String) -> UIColor? {
        return UIColor(named: colorName, in: Bundle(for: PrivateAssets.self), compatibleWith: nil)
    }
    
    private static func color(_ colorName: String, `default`: UIColor) -> UIColor {
        guard let assetColor = color(colorName) else { return `default` }
        return assetColor
    }
    
    private static func image(_ imageName: String) -> UIImage? {
        return UIImage(named: imageName, in: Bundle(for: PrivateAssets.self), compatibleWith: nil)
    }
    
    private static func image(_ imageName: String, tint: UIColor) -> UIImage? {
        return image(imageName)?.tint(with: tint)
    }

}
