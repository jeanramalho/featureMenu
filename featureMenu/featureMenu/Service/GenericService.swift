//
//  GenericService.swift
//  featureMenu
//
//  Created by Jean Ramalho on 06/12/24.
//

import Foundation

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
}
