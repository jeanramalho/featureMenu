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

class MenuProfileViewModel {
    
    private let service: MenuProfileService = MenuProfileService()
    
    public func fetch(_ typeFetch: typeFetch){
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
