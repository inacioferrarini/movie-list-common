import Quick
import Nimble
@testable import Common

class UIColorUtilSpec: QuickSpec {

    override func spec() {

        describe("Extension methods") {

            let compareColor = UIColor(red: 255/255, green: 204/255, blue: 170/255, alpha: 255/255)

            it("Must create color from 6 characters") {
                let color = UIColor(hex: "FFCCAA")
                expect(color).toNot(beNil())
                expect(compareColor.isEqual(color)).to(beTruthy())
            }

            it("Must create color from 7 characters") {
                let color = UIColor(hex: "#FFCCAA")
                expect(color).toNot(beNil())
                expect(compareColor.isEqual(color)).to(beTruthy())
            }

            it("Must create color from 8 characters") {
                let color = UIColor(hex: "FFCCAAFF")
                expect(color).toNot(beNil())
                expect(compareColor.isEqual(color)).to(beTruthy())
            }
            
            it("Must create color from 9 characters") {
                let color = UIColor(hex: "#FFCCAAFF")
                expect(color).toNot(beNil())
                expect(compareColor.isEqual(color)).to(beTruthy())
            }
            
            it("Must return nil if color does not exist") {
                let color = UIColor(hex: "CCGGA")
                expect(color).to(beNil())
            }

        }

    }

}
