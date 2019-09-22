import UIKit

extension UISearchBar {

    public func setTextBackground(_ color: UIColor?) {
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = color
    }

    public func setCenteredPlaceHolder() {
        let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField

        let searchBarWidth = self.frame.width
        let placeholderIconWidth = textFieldInsideSearchBar?.leftView?.frame.width
        let placeHolderWidth = textFieldInsideSearchBar?.attributedPlaceholder?.size().width
        let offsetIconToPlaceholder: CGFloat = 8
        let placeHolderWithIcon = placeholderIconWidth! + offsetIconToPlaceholder

        let offset = UIOffset(horizontal: ((searchBarWidth / 2) - (placeHolderWidth! / 2) - placeHolderWithIcon), vertical: 0)
        self.setPositionAdjustment(offset, for: .search)
    }

}
