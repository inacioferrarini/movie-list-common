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

public struct DefaultNavigationBarTheme: NavigationBarThemeProtocol {

    ///
    /// Default constructor.
    ///
    public init() {}

    ///
    /// Color to be used for background
    ///
    public var backgroundColor: UIColor? {
        return UIColor(hex: "#F7CE5B")
    }

    ///
    /// Color to be used for text background
    ///
    public var textBackgroundColor: UIColor? {
        return UIColor(hex: "#D9971E")
    }

    ///
    /// Color to be used for title
    ///
    public var titleColor: UIColor? {
        return UIColor(hex: "#2D3047")
    }

    ///
    /// Color to be used for icons
    ///
    public var iconColor: UIColor? {
        return UIColor(hex: "#2D3047")
    }

}
