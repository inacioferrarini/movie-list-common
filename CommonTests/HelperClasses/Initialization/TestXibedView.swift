import UIKit
import Common

class TestXibedView: UIView {

    let string = "Text String"

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

extension TestXibedView: XibedView {}
