//
//  MovieDetails.swift
//  MoviesAPP
//
//  Created by Franklin  Stilhano on 1/26/23.
//

import UIKit

protocol MovieServiceProtocol: GenericService {
    func getMovie(id: Int, completion: @escaping completion<ResultElement?>)
}

class MovieService: MovieServiceProtocol {
    func getMovie(id: Int, completion: @escaping completion<ResultElement?>) {
        
        let urlString: String = "https://api.themoviedb.org/3/movie/\(id)?api_key=0a1c6886a4fdd146b80c78de298ecdb1"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(ResultElement.self, from: data)
                print(result)
                completion(result, nil)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
