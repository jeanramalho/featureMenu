//
//  ViewController.swift
//  featureMenu
//
//  Created by Jean Ramalho on 10/12/24.
//

import UIKit

class MenuProfileVC: UIViewController {
    
    var screen: MenuProfileScreen?
    
    let viewModel: MenuProfileViewModel = MenuProfileViewModel()
    
    override func loadView() {
        self.screen = MenuProfileScreen()
        self.view = self.screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fetch(.mock)
    }
}

extension MenuProfileVC: MenuProfileViewModelDelegate {
    func success() {
        print("Deu Certo")
    }
    
    func error(_ message: String) {
        print("Deu Ruim \(message)")
    }
    
    
}

