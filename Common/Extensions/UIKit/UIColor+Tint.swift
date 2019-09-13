//
//  UIColor+Tint.swift
//  Common
//
//  Created by José Inácio Athayde Ferrarini on 12/09/19.
//  Copyright © 2019 José Inácio Athayde Ferrarini. All rights reserved.
//

import UIKit

extension UIImage {
    
    func tint(with color: UIColor) -> UIImage? {
        var image: UIImage? = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()

        image?.draw(in: CGRect(origin: .zero, size: size))
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image?.withRenderingMode(.alwaysOriginal)
    }
    
}
