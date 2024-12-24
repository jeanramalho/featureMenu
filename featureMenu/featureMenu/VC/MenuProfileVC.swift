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

extension MenuProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionView()
        view.referenceButton.addTarget(self, action: #selector(tapSection(_:)), for: .touchUpInside)
        view.referenceButton.tag = section
        view.setupSection(description: viewModel.titleForSection(section: section))
        view.expandButton(value: viewModel.containSection(section))
        return view
    }
    
    @objc func tapSection(_ sender: UIButton) {
        let section = sender.tag
        if viewModel.containSection(section) {
            viewModel.tappedSection(type: .remove, section: section)
            screen?.insertRowsTableView(indexPath: viewModel.indexPathForSection(section), section: section)
        } else {
            viewModel.tappedSection(type: .insert, section: section)
            screen?.deleteRowsTableView(indexPath: viewModel.indexPathForSection(section), section: section)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuProfileTableViewCell.identifier, for: indexPath) as? MenuProfileTableViewCell
        cell?.setupCell(title: viewModel.titleForCell(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    
}

extension MenuProfileVC: MenuProfileViewModelDelegate {
    func success() {
        self.screen?.setupDelegateTableView(delegate: self, dataSource: self)
        self.screen?.tableView.reloadData()
    }
    
    func error(_ message: String) {
        print("Deu Ruim \(message)")
    }
    
    
}

