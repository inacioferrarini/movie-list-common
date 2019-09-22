import UIKit

/// View used to display a loading status
open class LoadingView: UIView {

    /// Public identifier for ErrorView
    public static let loadingViewTag = 400


    // MARK: - Outlets

    @IBOutlet weak private(set) var contentView: UIView!
    @IBOutlet weak private(set) var spinner: UIActivityIndicatorView!


    // MARK: - Initialization

    /// Initializes the view with using `UIScreen.main.bounds` as frame.
    public required init() {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }

    /// Initializes the view with using the given `frame`.
    /// - Parameter frame: Initial view dimensions.
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    /// Initializes the view with using the given `coder`.
    /// - Parameter aDecoder: NSCoder to be used.
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        let bundle = Bundle(for: type(of: self))
        let className = String(describing: type(of: self))
        bundle.loadNibNamed(className, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.tag = LoadingView.loadingViewTag
    }

}
