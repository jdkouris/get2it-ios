//
//  UIHelper.swift
//  Get2It
//
//  Created by John Kouris on 4/3/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

enum SectionLayoutKind: Int, CaseIterable {
    case header, grid, list, list2
    
    var columnCount: Int {
        switch self {
        case .header:
            return 1
        case .grid:
            return 2
        case .list:
            return 1
        case .list2:
            return 1
        }
    }
}

enum UIHelper {
    static func createHomeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionLayoutKind = SectionLayoutKind(rawValue: sectionIndex) else { return nil }
            
            switch sectionLayoutKind {
            case .grid:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
                
                let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: sectionLayoutKind.columnCount)
                let section = NSCollectionLayoutSection(group: group)
                
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
                
                return section
                
            case .list:
                let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(40))
                let item = NSCollectionLayoutItem(layoutSize: size)
                item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: .fixed(8), trailing: nil, bottom: .fixed(8))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
                
                return section
                
            case .header:
                let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(40))
                let item = NSCollectionLayoutItem(layoutSize: size)
                item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: .fixed(8), trailing: nil, bottom: .fixed(8))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)
                
                return section
                
            case .list2:
                let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(40))
                let item = NSCollectionLayoutItem(layoutSize: size)
                item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: .fixed(8), trailing: nil, bottom: .fixed(8))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
                
                return section
            }
        }
        
        return layout
    }
}
