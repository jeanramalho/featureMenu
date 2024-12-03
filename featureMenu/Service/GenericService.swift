//
//  GenericService.swift
//  featureMenu
//
//  Created by Jean Ramalho on 03/12/24.
//

import Foundation

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case fileNotFount(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
}
