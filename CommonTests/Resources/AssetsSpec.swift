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
