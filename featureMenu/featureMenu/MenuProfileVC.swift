//
//  ViewController.swift
//  featureMenu
//
//  Created by Jean Ramalho on 10/12/24.
//

import UIKit

class MenuProfileVC: UIViewController {
    
    let viewModel: MenuProfileViewModel = MenuProfileViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        viewModel.fetch(.mock)
    }
}

