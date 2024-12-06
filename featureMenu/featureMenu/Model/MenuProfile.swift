//
//  MenuProfile.swift
//  featureMenu
//
//  Created by Jean Ramalho on 06/12/24.
//

import Foundation

// MARK: - MenuProfileGroup
struct MenuProfileGroup: Codable {
    let group: [MenuProfile]?
}

// MARK: - MenuProfile
struct MenuProfile: Codable {
    let title: String?
    let child: [Item]?
}

// MARK: - Item
struct Item: Codable {
    let title: String?
}
