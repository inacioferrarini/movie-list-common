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
import Ness
@testable import Common

class GenreListResultNamesSpec: QuickSpec {

    override func spec() {

        describe("Extension methods") {
            
            var genreListResult: GenreListResult?
            
            beforeEach {
                genreListResult = GenreListResult()
            }
            
            it("when genres is nil, must return an empty array") {
                let names = genreListResult?.names(for: [10, 20])
                expect(names?.count).to(be(0))
            }
            
            it("when genres does not have an id, must not crash") {
                let genre1 = Genre(id: nil, name: "Genre 1")
                let genre2 = Genre(id: nil, name: "Genre 2")
                genreListResult?.genres = [genre1, genre2]
                let names = genreListResult?.names(for: [10, 20])
                expect(names?.count).to(be(0))
            }
            
            it("must return names for category ids when found") {
                let genre1 = Genre(id: 10, name: "Genre 1")
                let genre2 = Genre(id: 20, name: "Genre 2")
                genreListResult?.genres = [genre1, genre2]
                let names = genreListResult?.names(for: [10, 20])
                expect(names?.count).to(be(2))
                expect(names?[0]).to(equal("Genre 1"))
                expect(names?[1]).to(equal("Genre 2"))
            }
            
        }

    }

}
