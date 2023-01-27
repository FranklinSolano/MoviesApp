//
//  String+.swift
//  MoviesAPP
//
//  Created by Franklin  Stilhano on 1/23/23.
//

import Foundation

extension String {
    func formatDate() -> Self {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        let showDate = inputFormatter.date(from: self)
        guard let showDate = showDate else {
            return "Não foi possível obter a data"
        }
        inputFormatter.dateFormat = "dd/MM/yy"
        return inputFormatter.string(from: showDate)
    }
}
