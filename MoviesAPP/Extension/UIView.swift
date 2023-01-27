//
//  UIView.swift
//  MoviesAPP
//
//  Created by Franklin  Stilhano on 1/23/23.
//

import Foundation
import UIKit


class GradientView: UIView {
    let gradient = CAGradientLayer()
    
    init() {
        super.init(frame: .zero)
        gradient.frame = self.bounds
        gradient.colors = [UIColor.lightBackground.cgColor, UIColor.darkBackground.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        self.layer.addSublayer(gradient)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        gradient.frame = bounds
    }
}


