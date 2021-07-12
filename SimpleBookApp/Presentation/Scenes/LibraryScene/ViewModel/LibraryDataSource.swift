//
//  LibraryDataSource.swift
//  SimpleBookApp
//
//  Created by user200328 on 7/12/21.
//

import UIKit

class LibraryDataSource: NSObject{
    
    // MARK: - Variables
    private var tableView: UITableView!
    private var collectionView: UICollectionView!
    private var viewModel: LibraryViewModelProtocol!
    private var currentCategoryIndex = 0
    private var categoryNames = ["Reading", "Bookshel", "My", "", "", "", ""]
    
    // MARK: - Init
    init(with tableView: UITableView, collectionView: UICollectionView, viewModel: LibraryViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        if let flowLayout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
                flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        self.viewModel = viewModel
    }
    
}

// MARK: - UITableView Data Source
extension LibraryDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if currentCategoryIndex == 1 {
            return 2
        }
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if currentCategoryIndex == 0 {
            let cell = tableView.deque(ReadingCell.self, for: indexPath)
            cell.configure()
            return cell
        }
        
        if currentCategoryIndex == 1 {
            if indexPath.row == 0 {
                let cell = tableView.deque(BookShelCell.self, for: indexPath)
                cell.configure(with: "Arts & Photography Books")
                return cell
            }
            
            if indexPath.row == 1 {
                let cell = tableView.deque(BookShelCell.self, for: indexPath)
                cell.configure(with: "Business & Money")
                return cell
            }
        }
        
        if currentCategoryIndex == 2 {
            let cell = tableView.deque(MyBooksCell.self, for: indexPath)
            cell.configure()
            return cell
        }
        

        let cell = tableView.deque(MyBooksCell.self, for: indexPath)
        cell.configure()
        return cell
    }
}

// MARK: - UITableViewDelegate
extension LibraryDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if currentCategoryIndex == 0 {
            return 398
        }
        
        if currentCategoryIndex == 1 {
            return 340
        }
        
        if currentCategoryIndex == 2 {
            return 480
        }
        
        return 470
    }
}

// MARK - UICollectionView Data Source
extension LibraryDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(LibraryCategoryCell.self, for: indexPath)
        cell.configure(with: categoryNames[indexPath.row])
        return cell
    }
    
}

// MARK: - UICollectionView Delegate
extension LibraryDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentCategoryIndex = indexPath.row
        self.tableView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate Flow Layout
extension LibraryDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 100
    }
    
}
