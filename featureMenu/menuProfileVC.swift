//
//  ViewController.swift
//  featureMenu
//
//  Created by Jean Ramalho on 29/11/24.
//

import UIKit

class menuProfileVC: UIViewController {
    
    let viewModel: MenuProfileViewModel = MenuProfileViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        viewModel.fetch(.mock)
    }


}
