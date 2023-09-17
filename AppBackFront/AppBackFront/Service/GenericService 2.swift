//
//  GenericService.swift
//  AppBackFront
//
//  Created by Felipe Augusto Correia on 07/06/23.
//

import Foundation
import Alamofire


enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case errorRequest(AFError)
}

enum TypeFetch {
    case mock
    case request
}

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}




