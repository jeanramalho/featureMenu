//
//  MenuProfileScreen.swift
//  featureMenu
//
//  Created by Jean Ramalho on 18/12/24.
//

import UIKit

class MenuProfileScreen: UIView {
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        return view
    }()
    
    lazy var upArrowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedBack(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedBack(_ sender: UIButton){
        print(#function)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
        self.addSubview(headerView)
        headerView.addSubview(upArrowButton)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 40),
            
            upArrowButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            upArrowButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
    }
    
}
