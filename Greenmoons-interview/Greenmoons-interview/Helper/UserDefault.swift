//
//  UserDefault.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 2/9/2566 BE.
//

import Foundation

func saveFavoriteMovie(favorite: [Movies]) {
    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(favorite)
        UserDefaults.standard.set(data, forKey: "favoriteMovies")
    } catch {
        print("Unable to Encode Array (\(error))")
    }
}

func getFavoriteMovie() -> [Movies] {
    var favoriteMovies: [Movies] = [Movies]()
    if let data = UserDefaults.standard.data(forKey: "favoriteMovies") {
        do {
            let decoder = JSONDecoder()
            let favoriteMovieData = try decoder.decode([Movies].self, from: data)
            favoriteMovies = favoriteMovieData
        } catch {
            print("Unable to Decode (\(error))")
        }
    }
    return favoriteMovies
}

public func clearFavoriteMovie() {
    UserDefaults.standard.removeObject(forKey: "favoriteMovies")
}
