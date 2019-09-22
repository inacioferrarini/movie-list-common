import UIKit

public extension UIView {

    /// Shows an error view
    /// - Parameter message: The message to be displayed inside the view
    func showErrorView(message: String) {
        let view = ErrorView()
        view.setup(with: message)
        self.addSubview(view)
        self.bringSubviewToFront(view)
    }

    /// Hides the error message, if presented
    func hideErrorView() {
        self.viewWithTag(ErrorView.errorViewTag)?.removeFromSuperview()
    }

    /// Shows a loading view
    func showLoadingView() {
        let view = LoadingView()
        self.addSubview(view)
        self.bringSubviewToFront(view)
    }

    /// Hides the loading view, if presented
    func hideLoadingView() {
        self.viewWithTag(LoadingView.loadingViewTag)?.removeFromSuperview()
    }

    /// Shows a not found message view
    /// - Parameter message: The message to be displayed inside the view
    func showNotFoundView(message: String) {
        let view = NotFoundView()
        view.setup(with: message)
        self.addSubview(view)
        self.bringSubviewToFront(view)
    }

    /// Hides the not found view, if presented
    func hideNotFoundView() {
        self.viewWithTag(NotFoundView.notFoundViewTag)?.removeFromSuperview()
    }

}
