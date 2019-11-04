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
    /// Displays the message with given parameters.
    ///
    /// - Parameters:
    ///   - message: The message to be displayed.
    ///   - kind: The message kind.
    ///   - direction: Where the message will be displayed from.
    ///   - seconds: How many seconds the message will be visible.
    ///
    public func showMessage(_ message: String, kind: MessageView.Kind, direction: MessageView.Direction, seconds: Double = 6) {
        let messageView = MessageView()
        messageView.message = message
        messageView.kind = kind
        self.addSubview(messageView)

        if let anchorConstraint = setupConstraints(messageView: messageView, for: direction) {
            present(messageView, anchorConstraint: anchorConstraint, seconds: seconds)
        }
    }

    private func setupConstraints(messageView: MessageView, for direction: MessageView.Direction) -> NSLayoutConstraint? {
        NSLayoutConstraint(item: messageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: messageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0).isActive = true

        var anchorConstraint: NSLayoutConstraint?
        if .top == direction {
            anchorConstraint = NSLayoutConstraint(item: messageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: -500)
        } else if .bottom == direction {
            anchorConstraint = NSLayoutConstraint(item: messageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -500)
        }
        anchorConstraint?.isActive = true

        return anchorConstraint
    }

    private func present(_ messageView: MessageView, anchorConstraint: NSLayoutConstraint, seconds: Double) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                anchorConstraint.constant = 0
                self.setNeedsLayout()
                self.layoutIfNeeded()
            }, completion: { _ in
                self.hide(messageView, anchorConstraint: anchorConstraint, seconds: seconds)
            })
        }
    }

    private func hide(_ messageView: MessageView, anchorConstraint: NSLayoutConstraint, seconds: Double) {
        UIView.animate(withDuration: 0.3, delay: seconds, options: .curveEaseOut, animations: {
            anchorConstraint.constant = -500
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }, completion: { _ in
            messageView.removeFromSuperview()
        })
    }

}
