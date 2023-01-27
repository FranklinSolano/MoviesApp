//
//  HomeTableViewCell.swift
//  MoviesAPP
//
//  Created by Franklin  Stilhano on 1/23/23.
//

import UIKit
import AlamofireImage

class HomeTableViewCell: UITableViewCell {
    
    lazy var imageMovie: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    lazy var titleMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        return label
    }()
    
    lazy var releaseDataMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white.withAlphaComponent(0.75)
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        return label
    }()
    
    lazy var textStackView: UIStackView = {
            let stack = UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .vertical
            [titleMovieLabel, releaseDataMovieLabel].forEach { view in
                stack.addArrangedSubview(view)
            }
            stack.distribution = .fillProportionally
            stack.spacing = 8
            return stack
        }()

    lazy var mainStackView: UIStackView = {
            let stack = UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .horizontal
            [imageMovie, textStackView].forEach { view in
                stack.addArrangedSubview(view)
            }
            stack.distribution = .fillProportionally
            stack.spacing = 16.0
            stack.alignment = .center
            
            return stack
        }()

    static let identifier: String = "HomeTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        configElements()
        configConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(movie: ResultElement){
        titleMovieLabel.text = movie.title
        releaseDataMovieLabel.text = "Lançamento \(movie.releaseDate?.formatDate() ?? "" )"
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath ?? "")") ?? URL(fileURLWithPath: "")
        imageMovie.af.setImage(withURL: url)
    }
    
    func configElements(){
         addSubview(mainStackView)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            imageMovie.heightAnchor.constraint(equalToConstant: 120),
            imageMovie.widthAnchor.constraint(equalToConstant: 90),
        ])
    }
    
   

}
