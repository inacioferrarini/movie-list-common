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

class GenresApiSpec: QuickSpec {
    
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
                        guard let fixtureFile = OHPathForFile("MovieGenresResponseData.json", type(of: self)) else { return error }

                        return OHHTTPStubsResponse(
                            fileAtPath: fixtureFile,
                            statusCode: 200,
                            headers: ["Content-Type": "application/json"]
                        )
                    }

                    var genresResponse: GenreListResult? = nil
                    let api = APIs().genres
                    
                    // When
                    waitUntil { done in
                        api.genres(
                            apiKey: "",
                            success: { response in
                                genresResponse = response
                                done()
                        }, failure: { error in
                                fail("Mocked response returned error")
                                done()
                        })
                    }

                    // Then
                    expect(genresResponse).toNot(beNil())
                    expect(genresResponse?.genres).toNot(beNil())
                    expect(genresResponse?.genres?.count).to(equal(4))

                    let genre1 = genresResponse?.genres?[0]
                    expect(genre1?.id).to(equal(28))
                    expect(genre1?.name).to(equal("Action"))
                    
                    let genre2 = genresResponse?.genres?[1]
                    expect(genre2?.id).to(equal(12))
                    expect(genre2?.name).to(equal("Adventure"))
                    
                    let genre3 = genresResponse?.genres?[2]
                    expect(genre3?.id).to(equal(10770))
                    expect(genre3?.name).to(equal("TV Movie"))
                    
                    let genre4 = genresResponse?.genres?[3]
                    expect(genre4?.id).to(equal(37))
                    expect(genre4?.name).to(equal("Western"))
                }
                
                it("must call failure, if fails") {
                    // Given
                    stub(condition: isHost("api.themoviedb.org") && isMethodGET()) { _ in
                        let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                        return OHHTTPStubsResponse(error: notConnectedError)
                    }
                    
                    var genresResponse: GenreListResult? = nil
                    let api = APIs().genres

                    // When
                    waitUntil { done in
                        api.genres(
                            apiKey: "",
                            success: { response in
                                fail("Mocked response returned success")
                                genresResponse = response
                                done()
                        }, failure: { error in
                                done()
                        })
                    }
                    
                    // Then
                    expect(genresResponse).to(beNil())
                }
                
            }
            
        }

    }
    
}

