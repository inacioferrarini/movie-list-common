import UIKit

public extension UIView {

    func showErrorView(message: String) {
        let view = ErrorView()
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

    func showNotFoundView(expression: String) {
        let view = NotFoundView()
        self.addSubview(view)
        self.bringSubviewToFront(view)
    }

    func hideNotFoundView() {
        self.viewWithTag(NotFoundView.notFoundViewTag)?.removeFromSuperview()
    }

}
