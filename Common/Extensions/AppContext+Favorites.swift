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

import Foundation
import Ness

///
/// Adds capabilities to AppContext
///
public extension AppContext {
    
    ///
    /// Adds the given movie to the list of favorite movies
    ///
    /// - Parameter favorite: The movie to be added to the favorite list.
    ///
    func add(favorite: Movie) {
        var favoriteMovies = allFavorites()
        favoriteMovies.append(favorite)
        set(value: favoriteMovies, for: FavoriteMoviesKey)
    }
    
    ///
    /// Adds the given movie to the list of favorite movies
    ///
    /// - Parameter favorites: The movies to be added to the favorite list.
    ///
    func add(favorites: [Movie]) {
        var favoriteMovies = allFavorites()
        favoriteMovies.append(contentsOf: favorites)
        set(value: favoriteMovies, for: FavoriteMoviesKey)
    }
    
    ///
    /// Returns if the given `movie id` is already a favorite.
    ///
    /// - Parameter movieId: The movie Id to be checked
    /// - Returns: If the movie is a favorite or not.
    ///
    func isFavorite(movieId: Int) -> Bool {
        let favoriteMovies = allFavorites()
        let favoriteIds = favoriteMovies.compactMap({ return $0.id })
        return favoriteIds.contains(movieId)
    }
    
    ///
    /// Removies the given movie from the favorite movie list.
    ///
    /// - Parameter favorite: The movie to be removed from favorite list.
    ///
    func remove(favorite: Movie) {
        guard let movieId = favorite.id else { return }
        var favoriteMovies = allFavorites()
        favoriteMovies = favoriteMovies.filter({ return $0.id != movieId })
        set(value: favoriteMovies, for: FavoriteMoviesKey)
    }
    
    ///
    /// Returns all favorite movies.
    ///
    /// - Returns: Favorite movies list
    ///
    func allFavorites() -> FavoriteMoviesType {
        guard let favoriteMovies: FavoriteMoviesType = get(key: FavoriteMoviesKey) else { return [] }
        return favoriteMovies
    }
    
}
