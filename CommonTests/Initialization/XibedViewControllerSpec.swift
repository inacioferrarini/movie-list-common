import Quick
import Nimble
@testable import Common

class XibedViewControllerSpec: QuickSpec {

    override func spec() {
        
        describe("Initialization") {
            
            it("Must initialize the ViewController from instantiate()") {
                let sut = TestXibedViewController.instantiate()
                expect(sut).toNot(beNil())
                expect(sut?.title).to(equal("TestXibedViewController Title"))
            }

        }

    }

}
