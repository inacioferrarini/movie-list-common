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
import OHHTTPStubs
import Common
@testable import Ness

class MoviesApiSpec: QuickSpec {
    
    override func spec() {
        
        describe("Api Requests") {
            
            context("genres request") {
                
                afterEach {
                    OHHTTPStubs.removeAllStubs()
                }
                
                it("must call success, if succeeds") {
                    // Given
                    stub(condition: isHost("api.themoviedb.org") && isMethodGET()) { _ in
                        let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                        let error = OHHTTPStubsResponse(error:notConnectedError)
                        guard let fixtureFile = OHPathForFile("MostPopularMoviesResponseData.json", type(of: self)) else { return error }

                        return OHHTTPStubsResponse(
                            fileAtPath: fixtureFile,
                            statusCode: 200,
                            headers: ["Content-Type": "application/json"]
                        )
                    }

                    var movieSearchResponse: MovieSearchResult? = nil
                    let api = APIs().movies
                    
                    // When
                    waitUntil { done in
                        api.popularMovies(
                            apiKey: "",
                            success: { response in
                                movieSearchResponse = response
                                done()
                        }, failure: { error in
                                fail("Mocked response returned error")
                                done()
                        })
                    }
                    
                    // Then
                    expect(movieSearchResponse).toNot(beNil())
                    expect(movieSearchResponse?.page).to(equal(1))
                    expect(movieSearchResponse?.totalResults).to(equal(2))
                    expect(movieSearchResponse?.totalPages).to(equal(1))
                    expect(movieSearchResponse?.results).toNot(beNil())
                    
                    expect(movieSearchResponse?.results?.count).to(equal(2))
                    
                    let result0 = movieSearchResponse?.results?[0]
                    expect(result0?.id).to(equal(474350))
                    expect(result0?.title).to(equal("It Chapter Two"))
                    expect(result0?.overview).to(equal("27 years after overcoming the malevolent supernatural entity Pennywise, the former members of the Losers' Club, who have grown up and moved away from Derry, are brought back together by a devastating phone call."))
                    expect(result0?.posterPath).to(equal("/zfE0R94v1E8cuKAerbskfD3VfUt.jpg"))
                    expect(result0?.genreIds).to(equal([35, 27]))
                    expect(result0?.releaseDate).to(equal("2019-09-06"))
                    expect(result0?.genreNames).to(beNil())
                    expect(result0?.isFavorite).to(beNil())
                    
                    let result1 = movieSearchResponse?.results?[1]
                    expect(result1?.id).to(equal(429617))
                    expect(result1?.title).to(equal("Spider-Man: Far from Home"))
                    expect(result1?.overview).to(equal("Peter Parker and his friends go on a summer trip to Europe. However, they will hardly be able to rest - Peter will have to agree to help Nick Fury uncover the mystery of creatures that cause natural disasters and destruction throughout the continent."))
                    expect(result1?.posterPath).to(equal("/lcq8dVxeeOqHvvgcte707K0KVx5.jpg"))
                    expect(result1?.genreIds).to(equal([28, 12, 878]))
                    expect(result1?.releaseDate).to(equal("2019-07-02"))
                    expect(result1?.genreNames).to(beNil())
                    expect(result1?.isFavorite).to(beNil())
                }
                
                it("must call failure, if fails") {
                    // Given
                    stub(condition: isHost("api.themoviedb.org") && isMethodGET()) { _ in
                        let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                        return OHHTTPStubsResponse(error: notConnectedError)
                    }

                    var movieSearchResult: MovieSearchResult? = nil
                    let api = APIs().movies

                    // When
                    waitUntil { done in
                        api.popularMovies(
                            apiKey: "",
                            success: { response in
                                fail("Mocked response returned success")
                                movieSearchResult = response
                                done()
                        }, failure: { error in
                                done()
                        })
                    }

                    // Then
                    expect(movieSearchResult).to(beNil())
                }
                
            }
            
        }
        
    }
    
}

