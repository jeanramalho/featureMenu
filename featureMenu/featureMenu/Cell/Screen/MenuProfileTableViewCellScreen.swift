//
//  MenuProfileTableViewCellScreen.swift
//  featureMenu
//
//  Created by Jean Ramalho on 24/12/24.
//

import UIKit

class MenuProfileTableViewCellScreen: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray.withAlphaComponent(0.1)
        addSubview(titleLabel)
        addSubview(lineView)
        configConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraint(){
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 0.8)
        ])
    }
    
}
