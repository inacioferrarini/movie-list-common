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
/// Used to display a toast-like message, that can be presented from top or from bottom.
///
public class MessageView: UIView {

    ///
    /// The message style
    ///
    public enum Kind {

        ///
        /// Used to display an error-like message.
        ///
        case error

        ///
        /// Used to display an success-like message.
        ///
        case success
    }

    ///
    /// The direction from where the message will be presented.
    ///
    public enum Direction {

        ///
        /// Displays message from top.
        ///
        case top

        ///
        /// Displays message from bottom.
        ///
        case bottom
    }

    // MARK: - Outlets

    @IBOutlet weak private(set) public var contentView: UIView!
    @IBOutlet weak var messageLabel: UILabel!

    // MARK: - Properties

    ///
    /// Sets the message kind.
    ///
    public var kind: Kind = .success {
        didSet {
            setupView()
        }
    }

    ///
    /// Sets the message text.
    ///
    public var message: String = "" {
        didSet {
            messageLabel.text = message
        }
    }

    // MARK: - Initialization

    ///
    /// Initializes the view with using `.zero` as frame.
    ///
    public required init() {
        super.init(frame: .zero)
        commonInit()
    }

    ///
    /// Initializes the view with using the given `frame`.
    /// - Parameter frame: Initial view dimensions.
    ///
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    ///
    /// Initializes the view with using the given `coder`.
    /// - Parameter aDecoder: NSCoder to be used.
    ///
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        loadView()
        addSubview(contentView)
        setupConstraints()
        setupView()
    }

    // MARK: - Setup

    private func loadView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        let bundle = Bundle(for: type(of: self))
        let className = String(describing: type(of: self))
        bundle.loadNibNamed(className, owner: self, options: nil)
    }

    private func setupConstraints() {
        self.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
        self.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .vertical)

        let layoutAttributes: [NSLayoutConstraint.Attribute] = [.top, .leading, .bottom, .trailing]
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(layoutAttributes.map { attribute in
            NSLayoutConstraint(
                item: contentView,
                attribute: attribute,
                relatedBy: .equal,
                toItem: self,
                attribute: attribute,
                multiplier: 1,
                constant: 0.0
            )
        })
    }

    private func setupView() {
        self.clipsToBounds = true
        var color: UIColor?
        if self.kind == .success {
            color = .green
        } else if self.kind == .error {
            color = .red
        }
        self.messageLabel.backgroundColor = color
        self.backgroundColor = color

        self.messageLabel.font = UIFont.preferredFont(forTextStyle: .body)
        self.messageLabel.textColor = UIColor.white
    }

}
