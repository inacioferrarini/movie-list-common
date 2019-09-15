import Foundation
import Common

class TestClass {
}

extension TestClass: Internationalizable {

    var titleString: String {
        return string("str1", languageCode: "en-US")
    }
    
}
