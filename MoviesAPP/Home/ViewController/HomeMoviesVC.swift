//
//  ViewController.swift
//  MoviesAPP
//
//  Created by Franklin  Stilhano on 1/23/23.
//

import UIKit

class HomeMoviesVC: UIViewController {
    
    var screen: HomeMoviesScreen?
    var data: [ResultElement] = [ ]
    private let service: MovieList = MovieList()
    
    override func loadView() {
        screen = HomeMoviesScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTableView(delegate: self, dataSource: self)
        fetchHome()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func fetchHome(){
        service.getHome { result, failure in
            if let result = result{
                self.data = result
            } else {
                print("deu ruim")
            }
            
            DispatchQueue.main.async {
                self.screen?.tableView.reloadData()
            }
        }
    }
}

extension HomeMoviesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell? = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        cell?.setupCell(movie: data[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc:DetailsVC = DetailsVC()
        vc.id = data[indexPath.row].id ?? 0
        self.navigationController?.pushViewController(vc, animated: false)
        return
    }
}

