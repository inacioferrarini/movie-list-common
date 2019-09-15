import Quick
import Nimble
@testable import Common

class ViewCodedViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        describe("Initialization") {
            
            it("Must initialize the ViewController from instantiate()") {
                let sut = TestViewCodedViewController.instantiate()
                expect(sut).toNot(beNil())
                expect(sut?.title).to(equal("TestViewCodedViewController Title"))
            }
            
        }
        
    }
    
}
