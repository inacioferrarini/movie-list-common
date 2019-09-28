//    The MIT License (MIT)
//
//    Copyright (c) 2019 Inácio Ferrarini
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.
//

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
