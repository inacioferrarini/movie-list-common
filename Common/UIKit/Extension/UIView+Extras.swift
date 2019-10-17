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
    /// Shows an Empty State view with the given message.
    /// - Parameter message: The message to be displayed inside the view
    ///
    func showEmptyStateView(message: String) {
        var view = self.viewWithTag(EmptyStateView.emptyStateViewTag) as? EmptyStateView
        if view == nil {
            let newView = EmptyStateView()
            self.addSubview(newView)
            self.bringSubviewToFront(newView)
            view = newView
        }
        view?.setup(with: message)
    }

    ///
    /// Hides the error message, if presented
    ///
    func hideEmptyStateView() {
        self.viewWithTag(EmptyStateView.emptyStateViewTag)?.removeFromSuperview()
    }

    ///
    /// Shows an error view
    /// - Parameter message: The message to be displayed inside the view
    ///
    func showErrorView(message: String) {
        var view = self.viewWithTag(ErrorView.errorViewTag) as? ErrorView
        if view == nil {
            let newView = ErrorView()
            self.addSubview(newView)
            self.bringSubviewToFront(newView)
            view = newView
        }
let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
selectionFeedbackGenerator.selectionChanged()
        view?.setup(with: message)
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
        var view = self.viewWithTag(LoadingView.loadingViewTag) as? LoadingView
        if view == nil {
            let newView = LoadingView()
            self.addSubview(newView)
            self.bringSubviewToFront(newView)
            view = newView
        }
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
        var view = self.viewWithTag(NotFoundView.notFoundViewTag) as? NotFoundView
        if view == nil {
            let newView = NotFoundView()
            self.addSubview(newView)
            self.bringSubviewToFront(newView)
            view = newView
        }
let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
selectionFeedbackGenerator.selectionChanged()
        view?.setup(with: message)
    }

    ///
    /// Hides the not found view, if presented
    ///
    func hideNotFoundView() {
        self.viewWithTag(NotFoundView.notFoundViewTag)?.removeFromSuperview()
    }

}
