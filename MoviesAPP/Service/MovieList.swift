//
//  Network.swift
//  MoviesAPP
//
//  Created by Franklin  Stilhano on 1/24/23.
//

import UIKit

protocol MovieListProtocol: GenericService {
    func getHome(completion: @escaping completion<[ResultElement]?>)
}

class MovieList: MovieListProtocol {
    func getHome(completion: @escaping completion<[ResultElement]?>) {
        
        let urlString: String = "https://api.themoviedb.org/3/movie/popular?api_key=0a1c6886a4fdd146b80c78de298ecdb1"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(Results.self, from: data)
                completion(result.results, nil)
            } catch {
                print("DEu ruim")
            }
        }
        task.resume()
    } 
}


