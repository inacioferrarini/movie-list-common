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

public extension MovieSearchResult {

    /// Returns a new `MovieSearchResult` objects from `rhs` and `lhs`.
    ///
    /// - Parameters:
    ///   - lhs: Source for `page`, `totalResults` and `totalPages`. `results` copyed last
    ///   - rhs: Source for first `results`
    /// - Returns: Returns a new `MovieSearchResult`
    public static func + (lhs: MovieSearchResult, rhs: MovieSearchResult) -> MovieSearchResult {
        var mergedResult = MovieSearchResult()
        mergedResult.page = lhs.page
        mergedResult.totalPages = lhs.totalPages
        mergedResult.totalResults = lhs.totalResults

        let rhsResults = rhs.results ?? []
        let lhsResults = lhs.results ?? []
        mergedResult.results = rhsResults + lhsResults

        return mergedResult
    }

    /// Updates the favorite status for every movie, using the
    /// ids presents in `favoriteIds`.
    ///
    /// If an `movieId` is not present, it will no longer be a favorite.
    ///
    /// - Parameter favoriteIds: Favorite movie ids.
    public mutating func updateFavorites(favoriteIds: [Int]) {
        guard let movies = results else { return }
        var updatedMovies: [Movie] = []
        for var movie in movies {
            movie.isFavorite = favoriteIds.contains(movie.id ?? -1)
            updatedMovies.append(movie)
        }
        self.results = updatedMovies
    }

}
