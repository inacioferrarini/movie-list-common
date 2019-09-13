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
            
            public static let backgroundColor = UIColor(named: "TabBarBackgroundColor",
                                                        in: Bundle(for: PrivateAssets.self),
                                                        compatibleWith: nil)
            
            public static let selectedTextColor = UIColor(named: "TabBarSelectedTextColor",
                                                          in: Bundle(for: PrivateAssets.self),
                                                          compatibleWith: nil)
            
            public static let unselectedTextColor = UIColor(named: "TabBarUnselectedTextColor",
                                                            in: Bundle(for: PrivateAssets.self),
                                                            compatibleWith: nil)
            
            public static let selectedIconColor = UIColor(named: "TabBarSelectedIconColor",
                                                          in: Bundle(for: PrivateAssets.self),
                                                          compatibleWith: nil)
            
            public static let unselectedIconColor = UIColor(named: "TabBarUnselectedIconColor",
                                                            in: Bundle(for: PrivateAssets.self),
                                                            compatibleWith: nil)
        }
        
        public struct NavigationBar {
            
            public static let backgroundColor = UIColor(named: "NavigationBarBackgroundColor",
                                                        in: Bundle(for: PrivateAssets.self),
                                                        compatibleWith: nil)

            public static let titleColor = UIColor(named: "NavigationBarTitleTextColor",
                                                   in: Bundle(for: PrivateAssets.self),
                                                   compatibleWith: nil)

            public static let iconColor = UIColor(named: "NavigationBarIconColor",
                                                  in: Bundle(for: PrivateAssets.self),
                                                  compatibleWith: nil)
        }

    }
    
    public struct Icons {
        
        public struct Modules {

            public static let Favorite = UIImage(named: "FavoriteMoviesIcon",
                                                 in: Bundle(for: PrivateAssets.self),
                                                 compatibleWith: nil)?
                .tint(with: Assets.Colors.TabBar.selectedIconColor ?? UIColor.blue)
            
            public static let Catalog = UIImage(named: "MoviesCatalogIcon",
                                                in: Bundle(for: PrivateAssets.self),
                                                compatibleWith: nil)?
                .tint(with: Assets.Colors.TabBar.selectedIconColor ?? UIColor.blue)
        }

        public static let check = UIImage(named: "check_icon")
        public static let favoriteFull = UIImage(named: "favorite_full_icon")
        public static let favoriteGray = UIImage(named: "favorite_gray_icon")
        public static let filter = UIImage(named: "FilterIcon")
        public static let search = UIImage(named: "search_icon")
    }
    
}
