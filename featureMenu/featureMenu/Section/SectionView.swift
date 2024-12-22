//
//  SectionView.swift
//  featureMenu
//
//  Created by Jean Ramalho on 22/12/24.
//

import UIKit

class SectionView: UIView {
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var referenceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        return button
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var arrowImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.tintColor = .purple
        return img
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(referenceButton)
        self.addSubview(arrowImageView)
        self.addSubview(descriptionLabel)
        self.addSubview(lineView)
        confiConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupSection(description: String) {
        self.descriptionLabel.text = description
    }
    
    private func confiConstraints(){
        NSLayoutConstraint.activate([
            referenceButton.topAnchor.constraint(equalTo: self.topAnchor),
            referenceButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            referenceButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            referenceButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            arrowImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
}
