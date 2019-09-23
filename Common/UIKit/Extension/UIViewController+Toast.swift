//    The MIT License (MIT)
//
//    Copyright (c) 2017 Inácio Ferrarini
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
import SVProgressHUD

extension UIViewController {


    // MARK: - Toast

    ///
    /// Displays an empty toast
    ///
    public func toast() {
        SVProgressHUD.show()
    }

    ///
    /// Displays a Toast with the given message
    /// - Parameter message: The message to be displayed
    ///
    public func toast(withMessage message: String) {
        SVProgressHUD.show(withStatus: message)
    }

    ///
    /// Displays a Toast with the given success message
    /// - Parameter message: The message to be displayed
    ///
    public func toast(withSuccessMessage message: String) {
        SVProgressHUD.showSuccess(withStatus: message)
    }

    ///
    /// Displays a Toast with the given Error message
    /// - Parameter message: The message to be displayed
    ///
    public func toast(withErrorMessage errorMessage: String) {
        SVProgressHUD.showError(withStatus: errorMessage)
    }

    ///
    /// Removes the toast
    ///
    public func toastEnd() {
        SVProgressHUD.dismiss()
    }

}
