//
//  GenericService.swift
//  MoviesAPP
//
//  Created by Franklin  Stilhano on 1/24/23.
//

import Foundation


protocol GenericService: AnyObject {
    typealias completion <T> = (_ result : T, _ failure: Error?) -> Void
}

//enum Error: Swift.Error {
//    case fileNotFound(name: String)
//    case fileDecodingFailed(name:String, Swift.Error)
//}
