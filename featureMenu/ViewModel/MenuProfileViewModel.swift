//
//  MenuProfileViewModel.swift
//  featureMenu
//
//  Created by Jean Ramalho on 29/11/24.
//

import UIKit

enum TypeFetch {
    case mock
    case request
}

class MenuProfileViewModel {
    private let service: MenuProfileService = MenuProfileService()
    
    public func fetch(_ typeFetch: TypeFetch){
        switch typeFetch {
        case .mock:
            self.service.getMenuFromJson { success, error in
            print(success)
            }
        case .request:
            break
        }
    }
}