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

public extension UIView {

    ///
    /// Shows an error view
    /// - Parameter message: The message to be displayed inside the view
    ///
    func showErrorView(message: String) {
        let view = ErrorView()
        view.setup(with: message)
        self.addSubview(view)
        self.bringSubviewToFront(view)
    }

    ///
    /// Hides the error message, if presented
    ///
    func hideErrorView() {
        self.viewWithTag(ErrorView.errorViewTag)?.removeFromSuperview()
    }

    ///
    /// Shows a loading view
    ///
    func showLoadingView() {
        let view = LoadingView()
        self.addSubview(view)
        self.bringSubviewToFront(view)
    }

    ///
    /// Hides the loading view, if presented
    ///
    func hideLoadingView() {
        self.viewWithTag(LoadingView.loadingViewTag)?.removeFromSuperview()
    }

    ///
    /// Shows a not found message view
    /// - Parameter message: The message to be displayed inside the view
    ///
    func showNotFoundView(message: String) {
        let view = NotFoundView()
        view.setup(with: message)
        self.addSubview(view)
        self.bringSubviewToFront(view)
    }

    ///
    /// Hides the not found view, if presented
    ///
    func hideNotFoundView() {
        self.viewWithTag(NotFoundView.notFoundViewTag)?.removeFromSuperview()
    }

}
