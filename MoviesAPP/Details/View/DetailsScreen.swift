//
//  DetailsScreen.swift
//  MoviesAPP
//
//  Created by Franklin  Stilhano on 1/25/23.
//

import UIKit

protocol DetailsScreenProtocol: AnyObject {
    func actionBackButton()
}

class DetailsScreen: UIView {
    
    var delegate: DetailsScreenProtocol?
    func delegate(delegate: DetailsScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var gradient: UIView =  {
        let view = GradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Voltar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(named: "back"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Teste"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var imageMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "dois")
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    lazy var assessmentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TesteUser"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "texto descricao"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedBackButton(){
        delegate?.actionBackButton()
    }
    
    func setupView(_ movie: [ResultElement]){
        titleLabel.text = movie[0].title ?? "teste"
        assessmentLabel.text = String(movie[0].voteAverage ?? 0)
        descriptionLabel.text = movie[0].overview ?? "aooo"
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie[0].posterPath ?? "")") ?? URL(fileURLWithPath: "")
        imageMovie.af.setImage(withURL: url)
    }
    
    func configElements(){
        addSubview(gradient)
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(imageMovie)
        addSubview(assessmentLabel)
        addSubview(descriptionLabel)
        
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            
            gradient.topAnchor.constraint(equalTo: topAnchor),
            gradient.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradient.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradient.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            backButton.widthAnchor.constraint(equalToConstant: 25),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor,constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15),
            
            imageMovie.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 15),
            imageMovie.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageMovie.heightAnchor.constraint(equalToConstant: 150),
            imageMovie.widthAnchor.constraint(equalToConstant: 120),
            
            assessmentLabel.topAnchor.constraint(equalTo: imageMovie.bottomAnchor,constant: 20),
            assessmentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: assessmentLabel.bottomAnchor,constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15)
            
            
        ])
    }
    
}
