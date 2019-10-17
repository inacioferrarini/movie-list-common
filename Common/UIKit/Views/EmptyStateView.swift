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

///
/// View used to display an Empty State
///
open class EmptyStateView: XibView {

    ///
    /// Public identifier for ErrorView
    ///
    public static let emptyStateViewTag = 800

    // MARK: - Outlets

    @IBOutlet weak var messageLabel: UILabel!

    // MARK: - Initialization

    ///
    /// Additional view setup
    ///
    override open func setupView() {
        self.tag = EmptyStateView.emptyStateViewTag
    }

    ///
    /// Configures the view with the given parameters.
    /// - Parameter text: Error message to be displayed
    ///
    public func setup(with text: String) {
        self.messageLabel.text = text
    }

}
