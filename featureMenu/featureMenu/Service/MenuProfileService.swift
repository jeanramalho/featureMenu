//
//  MenuProfileService.swift
//  featureMenu
//
//  Created by Jean Ramalho on 06/12/24.
//

import UIKit

protocol MenuProfileServiceDelegate: GenericService {
    func getMenuFromJson(completion: @escaping completion<MenuProfileGroup?>)
}

class MenuProfileService: MenuProfileServiceDelegate {
    func getMenuFromJson(completion: @escaping completion<MenuProfileGroup?>) {
        if let url = Bundle.main.url(forResource: "menuProfile", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let menu: MenuProfileGroup = try JSONDecoder().decode(MenuProfileGroup.self, from: data)
                completion(menu, nil)
            } catch  {
                completion(nil, Error.fileDecodingFailed(name: "menuProfile", error))
            }
        }
    }
    

}
