import Quick
import Nimble
@testable import Common

class StoryboardedSpec: QuickSpec {
    
    override func spec() {
        
        describe("Initialization") {
            
            it("Must initialize the ViewController from instantiate()") {
                let sut = TestStoryboarded.instantiate()
                expect(sut).toNot(beNil())
                expect(sut?.title).to(equal("TestStoryboarded Title"))
            }

            it("Must initialize the ViewController from instantiate(from: )") {
                let sut = TestStoryboarded.instantiate(from: "TestStoryboarded")
                expect(sut).toNot(beNil())
                expect(sut?.title).to(equal("TestStoryboarded Title"))
            }
            
        }
        
    }
    
}
