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

class MovieSearchResultOperatorSpec: QuickSpec {
    
    override func spec() {
        
        describe("Extension methods") {
            
            context("+ operator") {
                
                it("must properly merge objects") {
                    var oldMovie1 = Movie()
                    oldMovie1.title = "Old movie 1"
                    var oldMovie2 = Movie()
                    oldMovie2.title = "Old movie 2"
                    let oldResult = MovieSearchResult(page: 1, totalResults: 100, totalPages: 10, results: [oldMovie1, oldMovie2])

                    var newMovie1 = Movie()
                    newMovie1.title = "Movie 1"
                    var newMovie2 = Movie()
                    newMovie2.title = "Movie 2"
                    var newResult = MovieSearchResult(page: 2, totalResults: 100, totalPages: 10, results: [newMovie1, newMovie2])

                    newResult = newResult + oldResult
                    
                    expect(newResult.page).to(equal(2))
                    expect(newResult.totalResults).to(equal(100))
                    expect(newResult.totalPages).to(equal(10))
                    expect(newResult.results?.count).to(equal(4))
                    expect(newResult.results?[0].title).to(equal("Old movie 1"))
                    expect(newResult.results?[1].title).to(equal("Old movie 2"))
                    expect(newResult.results?[2].title).to(equal("Movie 1"))
                    expect(newResult.results?[3].title).to(equal("Movie 2"))
                }

                it("must properly merge objects, even when results is empty") {
                    let oldResult = MovieSearchResult(page: 1, totalResults: 100, totalPages: 10, results: nil)
                    var newResult = MovieSearchResult(page: 2, totalResults: 100, totalPages: 10, results: nil)
                    
                    newResult = newResult + oldResult
                    
                    expect(newResult.page).to(equal(2))
                    expect(newResult.totalResults).to(equal(100))
                    expect(newResult.totalPages).to(equal(10))
                    expect(newResult.results?.count).to(equal(0))
                }
            }
            
            context("updateFavorites method") {
                
                it("must properly update objects") {
                    var movie1 = Movie()
                    movie1.id = 200
                    movie1.title = "Old movie 1"
                    movie1.isFavorite = false
                    
                    var movie2 = Movie()
                    movie2.id = 300
                    movie2.title = "Old movie 2"
                    movie2.isFavorite = false
                    
                    var result = MovieSearchResult(page: 1, totalResults: 100, totalPages: 10, results: [movie1, movie2])
                    expect(result.results?[0].isFavorite).to(beFalsy())
                    expect(result.results?[1].isFavorite).to(beFalsy())
                    
                    let favoriteIds = [200, 300]
                    result.updateFavorites(favoriteIds: favoriteIds)
                    expect(result.results?[0].isFavorite).to(beTruthy())
                    expect(result.results?[1].isFavorite).to(beTruthy())
                }

                it("when results is nil, must do nothing") {
                    var result = MovieSearchResult(page: 1, totalResults: 100, totalPages: 10, results: nil)
                    let favoriteIds = [200, 300]
                    result.updateFavorites(favoriteIds: favoriteIds)
                    expect(result.results).to(beNil())
                }
            
                it("when movieId is nil, mut be handled as -1") {
                    var movie1 = Movie()
                    movie1.title = "Old movie 1"
                    movie1.isFavorite = false
                    
                    var movie2 = Movie()
                    movie2.title = "Old movie 2"
                    movie2.isFavorite = false
                    
                    var result = MovieSearchResult(page: 1, totalResults: 100, totalPages: 10, results: [movie1, movie2])
                    expect(result.results?[0].isFavorite).to(beFalsy())
                    expect(result.results?[1].isFavorite).to(beFalsy())
                    let favoriteIds = [-1]
                    result.updateFavorites(favoriteIds: favoriteIds)
                    expect(result.results?[0].isFavorite).to(beTruthy())
                    expect(result.results?[1].isFavorite).to(beTruthy())
                }
                
            }
            
        }

    }

}
