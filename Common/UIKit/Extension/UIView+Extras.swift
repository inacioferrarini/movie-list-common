import UIKit

public extension UIView {

    func showErrorView(message: String) {
        let view = ErrorView()
        view.setup(with: message)
        self.addSubview(view)
        self.bringSubviewToFront(view)
    }

    func hideErrorView() {
        self.viewWithTag(ErrorView.errorViewTag)?.removeFromSuperview()
    }

    func showLoadingView() {
        let view = LoadingView()
        self.addSubview(view)
        self.bringSubviewToFront(view)
    }

    func hideLoadingView() {
        self.viewWithTag(LoadingView.loadingViewTag)?.removeFromSuperview()
    }

    func showNotFoundView(message: String) {
        let view = NotFoundView()
        view.setup(with: message)
        self.addSubview(view)
        self.bringSubviewToFront(view)
    }

    func hideNotFoundView() {
        self.viewWithTag(NotFoundView.notFoundViewTag)?.removeFromSuperview()
    }

}
