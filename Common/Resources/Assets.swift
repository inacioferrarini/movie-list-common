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
            
            public static let background = UIColor(hex: "#F7CE5B")
            public static let icon = UIColor(hex: "#110F0A")
            public static let selectedIcon = UIColor(hex: "#110F0A")
            
        }
        
    }
    
    public struct Icons {
        
        public struct Modules {

            public static let Favorite = UIImage(named: "favorite_empty_icon",
                                                 in: Bundle(for: PrivateAssets.self),
                                                 compatibleWith: nil)
            public static let Catalog = UIImage(named: "list_icon",
                                                in: Bundle(for: PrivateAssets.self),
                                                compatibleWith: nil)

        }

        public static let check = UIImage(named: "check_icon")
        public static let favoriteFull = UIImage(named: "favorite_full_icon")
        public static let favoriteGray = UIImage(named: "favorite_gray_icon")
        public static let filter = UIImage(named: "FilterIcon")
        public static let search = UIImage(named: "search_icon")
    }
    
}
