//
//  HomeMoviesScreen.swift
//  MoviesAPP
//
//  Created by Franklin  Stilhano on 1/23/23.
//

import UIKit

class HomeMoviesScreen: UIView {
    
    lazy var gradient: UIView =  {
        let view = GradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

    

    lazy var popularMovies: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Filmes Populares"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return tv
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    func configElements(){
        addSubview(gradient)
        addSubview(popularMovies)
        addSubview(tableView)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            
            gradient.topAnchor.constraint(equalTo: topAnchor),
            gradient.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradient.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradient.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            popularMovies.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 35),
            popularMovies.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: popularMovies.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            
        ])
    }
    
}
