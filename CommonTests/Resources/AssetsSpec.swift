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

class AssetsSpec: QuickSpec {

    override func spec() {

        describe("Resources tests") {

            describe("Color assets") {
                
                describe("TabBar colors must return a Color") {

                    it("backgroundColor property") {
                        let color = Assets.Colors.TabBar.backgroundColor
                        expect(color).toNot(beNil())
                    }
                    
                    it("selectedTextColor property") {
                        let color = Assets.Colors.TabBar.selectedTextColor
                        expect(color).toNot(beNil())
                    }

                    it("unselectedTextColor property") {
                        let color = Assets.Colors.TabBar.unselectedTextColor
                        expect(color).toNot(beNil())
                    }

                    it("selectedIconColor property") {
                        let color = Assets.Colors.TabBar.selectedIconColor
                        expect(color).toNot(beNil())
                    }

                    it("unselectedIconColor property") {
                        let color = Assets.Colors.TabBar.unselectedIconColor
                        expect(color).toNot(beNil())
                    }

                }

                describe("NavigationBar colors must return a Color") {

                    it("backgroundColor property") {
                        let color = Assets.Colors.NavigationBar.backgroundColor
                        expect(color).toNot(beNil())
                    }

                    it("titleColor property") {
                        let color = Assets.Colors.NavigationBar.titleColor
                        expect(color).toNot(beNil())
                    }

                    it("iconColor property") {
                        let color = Assets.Colors.NavigationBar.iconColor
                        expect(color).toNot(beNil())
                    }

                }

            }

            describe("Icons assets") {

                describe("Modules icons must return an Image") {

                    it("favorite icon") {
                        let icon = Assets.Icons.Modules.favorite
                        expect(icon).toNot(beNil())
                    }

                    it("catalog icon") {
                        let icon = Assets.Icons.Modules.catalog
                        expect(icon).toNot(beNil())
                    }

                }

                describe("Status icons must return an Image") {

                    it("check icon") {
                        let icon = Assets.Icons.Status.check
                        expect(icon).toNot(beNil())
                    }

                    it("favoriteFull icon") {
                        let icon = Assets.Icons.Status.favoriteFull
                        expect(icon).toNot(beNil())
                    }

                    it("favoriteGray icon") {
                        let icon = Assets.Icons.Status.favoriteGray
                        expect(icon).toNot(beNil())
                    }

                }

                describe("Status icons must return an Image") {

                    it("filter icon") {
                        let icon = Assets.Icons.Actions.filter
                        expect(icon).toNot(beNil())
                    }

                    it("search icon") {
                        let icon = Assets.Icons.Actions.search
                        expect(icon).toNot(beNil())
                    }

                }

            }

        }

    }

}
