//
//  Assets.swift
//  MovieCatalog
//
//  Created by José Inácio Athayde Ferrarini on 07/09/19.
//  Copyright © 2019 José Inácio Athayde Ferrarini. All rights reserved.
//

import UIKit

private class PrivateAssets {}

public struct Assets {
    
    public struct Colors {
        
        public struct TabBar {
            public static let backgroundColor = color("TabBarBackgroundColor")
            public static let selectedTextColor = color("TabBarSelectedTextColor")
            public static let unselectedTextColor = color("TabBarUnselectedTextColor")
            public static let selectedIconColor = color("TabBarSelectedIconColor")
            public static let unselectedIconColor = color("TabBarUnselectedIconColor")
        }
        
        public struct NavigationBar {
            public static let backgroundColor = color("NavigationBarBackgroundColor")
            public static let titleColor = color("NavigationBarTitleTextColor")
            public static let iconColor = color("NavigationBarIconColor")
        }

    }
    
    public struct Icons {
        
        private static let selectedIconTintColor = Assets.Colors.TabBar.selectedIconColor ?? UIColor.blue
        
        public struct Modules {
            public static let favorite = image("FavoriteMoviesIcon", tint: selectedIconTintColor)
            public static let catalog = image("MoviesCatalogIcon", tint: selectedIconTintColor)
        }

        public static let check = image("check_icon")
        public static let favoriteFull = image("favorite_full_icon")
        public static let favoriteGray = image("favorite_gray_icon")
        public static let filter = image("FilterIcon")
        public static let search = image("search_icon")
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
