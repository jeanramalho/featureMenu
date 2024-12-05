//
//  MenuProfileService.swift
//  featureMenu
//
//  Created by Jean Ramalho on 03/12/24.
//

import UIKit
import Alamofire


protocol MenuProfileServiceDelegate: GenericService {
    func getMenuFromJson(completion: @escaping completion<MenuProfileGroup?>)
}


class MenuProfileService: MenuProfileServiceDelegate {
    
    func getMenu(completion: @escaping completion<MenuProfileGroup?>){
        let url: String = "https://run.mocky.io/v3/17ecb996-f8dd-412c-a337-f80b6d037ea2"
        
        AF.request(url, method: .get).validate().responseDecodable(of: MenuProfileGroup.self) { response in
            print(#function)
            debugPrint(response)
            
            switch response.result {
            case .success(let success):
                print("SUCCESS: \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("ERROR: \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    
    func getMenuFromJson(completion: @escaping completion<MenuProfileGroup?>) {
        if let url = Bundle.main.url(forResource: "menuProfile", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let menu: MenuProfileGroup = try JSONDecoder().decode(MenuProfileGroup.self, from: data)
                completion(menu,nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "menuProfile", error))
            }
        }
    }
    

}
