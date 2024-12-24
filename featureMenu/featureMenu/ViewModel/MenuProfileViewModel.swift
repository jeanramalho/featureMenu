//
//  MenuProfileViewModel.swift
//  featureMenu
//
//  Created by Jean Ramalho on 10/12/24.
//
import UIKit

enum typeFetch {
    case mock
    case request
}

protocol MenuProfileViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

enum TypeHiddenSection {
    case remove
    case insert
}

class MenuProfileViewModel {
    
    private let service: MenuProfileService = MenuProfileService()
    private weak var delegate: MenuProfileViewModelDelegate?
    private var data: [MenuProfile] = []
    private var hiddenSection = Set<Int>()
    
    public func delegate(delegate: MenuProfileViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: typeFetch){
        switch typeFetch {
        case .mock:
            self.service.getMenuFromJson { success, error in
                if let success = success {
                    self.data = success.group ?? []
                    self.delegate?.success()
                    self.hiddenAllSections()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        case .request:
            break
        }
    }
    
    public var numberOfSections: Int {
        self.data.count
    }
    
    public func titleForSection(section: Int) -> String {
        return self.data[section].title ?? ""
    }
    
    public func titleForCell(indexPath: IndexPath) -> String {
        return self.data[indexPath.section].child?[indexPath.row].title ?? ""
    }
    
    public func containSection (_ section: Int) -> Bool {
        return self.hiddenSection.contains(section)
    }
    
    public func tappedSection(type: TypeHiddenSection, section: Int){
        if type == .insert {
            hiddenSection.insert(section)
        } else {
            hiddenSection.remove(section)
        }
        
    }
    
    public func indexPathForSection(_ section: Int) -> [IndexPath]{
        var indexPath = [IndexPath]()
        let size = self.childCount(section)
        for row in 0..<size{
            indexPath.append(IndexPath(row: row, section: section))
        }
        return indexPath
    }
    
    private func childCount(_ section: Int) -> Int{
        return self.data[section].child?.count ?? 0
    }
    
    public func numberOfRowsInSection(section: Int) -> Int {
        if containSection(section) {
            return 0
        } else {
            return childCount(section)
        }
    }
    
    private func hiddenAllSections(){
        let size = numberOfSections
        for indexMenu in 0..<size {
            hiddenSection.insert(indexMenu)
        }
    }
    

}
