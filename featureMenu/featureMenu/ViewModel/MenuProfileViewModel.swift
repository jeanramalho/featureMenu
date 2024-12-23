//
//  MenuProfileViewModel.swift
//  featureMenu
//
//  Created by Jean Ramalho on 10/12/24.
//
import UIKit

enum typeFetch {
    case mock
    case request
}

protocol MenuProfileViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

class MenuProfileViewModel {
    
    private let service: MenuProfileService = MenuProfileService()
    private weak var delegate: MenuProfileViewModelDelegate?
    private var data: [MenuProfile] = []
    
    public func delegate(delegate: MenuProfileViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: typeFetch){
        switch typeFetch {
        case .mock:
            self.service.getMenuFromJson { success, error in
                if let success = success {
                    self.data = success.group ?? []
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        case .request:
            break
        }
    }
    
    public var numberOfSections: Int {
        self.data.count
    }

}
