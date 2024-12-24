//
//  MenuProfileTableViewCell.swift
//  featureMenu
//
//  Created by Jean Ramalho on 24/12/24.
//

import UIKit

class MenuProfileTableViewCell: UITableViewCell {
    
    static let identifier: String = "MenuProfileTableViewCell"
    
    let screen: MenuProfileTableViewCellScreen = MenuProfileTableViewCellScreen()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.screen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(screen)
        self.configConstraint()
    }
    
    private func configConstraint(){
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: self.topAnchor),
            screen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(title: String){
        screen.titleLabel.text = title
    }
    
}
