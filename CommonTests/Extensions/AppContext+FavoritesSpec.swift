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

class AppContextFavoritesSpec: QuickSpec {

    override func spec() {
        
        describe("Extension methods") {
            
            var sut: AppContext?
            
            beforeEach {
                sut = AppContext()
            }
            
            it("add(favorite: ) must add Movie to list") {
                expect(sut?.allFavorites().count).to(equal(0))
                let movie = Movie()
                sut?.add(favorite: movie)
                expect(sut?.allFavorites().count).to(equal(1))
            }
            
            it("add(favorites: ) must add [Movies] to list ") {
                expect(sut?.allFavorites().count).to(equal(0))
                let movies = [Movie(), Movie(), Movie()]
                sut?.add(favorites: movies)
                expect(sut?.allFavorites().count).to(equal(3))
            }

            context("isFavorite method") {
                
                beforeEach {
                    var movie1 = Movie()
                    movie1.id = 200
                    
                    var movie2 = Movie()
                    movie2.id = 400
                    
                    let movies = [movie1, movie2]
                    
                    sut?.add(favorites: movies)
                }
                
                it("must return true if the given movieId is contained in the favorite movies list") {
                    expect(sut?.allFavorites().count).to(equal(2))
                    expect(sut?.isFavorite(movieId: 200)).to(beTruthy())
                }
                
                it("must return false if the given movieId is not contained in the favorite movies list") {
                    expect(sut?.allFavorites().count).to(equal(2))
                    expect(sut?.isFavorite(movieId: 300)).to(beFalsy())
                }

            }
            
            context("remove method") {
                
                beforeEach {
                    var movie1 = Movie()
                    movie1.id = 200
                    
                    var movie2 = Movie()
                    movie2.id = 400
                    
                    let movies = [movie1, movie2]
                    
                    sut?.add(favorites: movies)
                }
                
                it("must remove if a movie with given id is found") {
                    expect(sut?.allFavorites().count).to(equal(2))
                    var movie = Movie()
                    movie.id = 200
                    sut?.remove(favorite: movie)
                    expect(sut?.allFavorites().count).to(equal(1))
                }
                
                it("must do nothing if a movie with given id is not found") {
                    expect(sut?.allFavorites().count).to(equal(2))
                    var movie = Movie()
                    movie.id = 300
                    sut?.remove(favorite: movie)
                    expect(sut?.allFavorites().count).to(equal(2))
                }

            }
            
        }

    }

}
