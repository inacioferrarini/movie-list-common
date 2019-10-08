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

private let FavoriteMoviesKey = "favoriteMovies"

///
/// Adds Favorites management capabilities to AppContext
///
public extension AppContext {

    ///
    /// Returns all favorites.
    /// This property is read only.
    ///
    /// To add a new favorite, check `add` methods.
    ///
    public var favorites: [Movie] {
        return get(key: FavoriteMoviesKey) ?? []
    }

    ///
    /// Returns the Ids from all favorites.
    /// This property is compounded from current favorites at the
    /// calculation execution moment.
    ///
    public var favoriteIds: [Int] {
        return favorites.compactMap({ return $0.id })
    }

    ///
    /// Adds the given movie to the list of favorite movies
    ///
    /// - Parameter favorite: The movie to be added to the favorite list.
    ///
    func add(favorite: Movie) {
        guard let movieId = favorite.id else { return }
        guard isFavorite(movieId: movieId) == false else { return }
        var updatedFavorites = favorites
        updatedFavorites.append(favorite)
        set(value: updatedFavorites, for: FavoriteMoviesKey)
    }

    ///
    /// Adds the given movie to the list of favorite movies
    ///
    /// - Parameter favorites: The movies to be added to the favorite list.
    ///
    func add(favorites: [Movie]) {
        favorites.forEach({ add(favorite: $0) })
    }

    ///
    /// Returns a favorite with given movie Id, if found. Returns `nil` otherwise.
    ///
    /// - Parameter id: Movie identifier.
    /// - Returns: A favorite movie with given Id, if found.
    ///
    func favorite(id: Int) -> Movie? {
        return favorites.filter({ return $0.id == id }).first
    }

    ///
    /// Returns if the given `movie id` is already a favorite.
    ///
    /// - Parameter movieId: The movie Id to be checked
    /// - Returns: If the movie is a favorite or not.
    ///
    func isFavorite(movieId: Int) -> Bool {
        return favoriteIds.contains(movieId)
    }

    ///
    /// Removes the given movie from the favorite movie list.
    ///
    /// - Parameter favorite: The movie to be removed from favorite list.
    ///
    func remove(favorite: Movie) {
        guard let movieId = favorite.id else { return }
        let favoriteMovies = favorites.filter({ return $0.id != movieId })
        set(value: favoriteMovies, for: FavoriteMoviesKey)
    }

}
