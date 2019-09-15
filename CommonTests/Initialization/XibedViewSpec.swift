import Quick
import Nimble
@testable import Common

class XibedViewSpec: QuickSpec {
    
    override func spec() {
        
        describe("Initialization") {
            
            it("Must initialize the View from instantiate()") {
                let sut = TestXibedView.instantiate()
                expect(sut).toNot(beNil())
                expect(sut?.string).to(equal("Text String"))
            }

        }

    }

}
