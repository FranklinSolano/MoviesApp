//
//  DetailsVC.swift
//  MoviesAPP
//
//  Created by Franklin  Stilhano on 1/25/23.
//

import UIKit

class DetailsVC: UIViewController {
    
    var screen: DetailsScreen?
    private let service:  MovieService = MovieService()
    var data: [ResultElement] = []
    var id: Int = 0
    
    
    override func loadView() {
        screen = DetailsScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        fetcMovieDetails()
    }
    
    
    func fetcMovieDetails(){
        service.getMovie(id: id) { result, failure in
            if let result {
                self.data.append(result)
                print(self.data)
            } else {
                print(result)
                
            }
            DispatchQueue.main.async {
                self.screen?.setupView(self.data)
            }
        }
    }
}

extension DetailsVC: DetailsScreenProtocol {
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
