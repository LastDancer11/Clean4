//
//  LibraryCellsDataSource.swift
//  SimpleBookApp
//
//  Created by user200328 on 7/12/21.
//


import UIKit

class LibraryCellsDataSource: NSObject{
    
    // MARK: - Variables
    private var collectionView: UICollectionView!
    private var viewModel: LibraryCellsViewModelProtocol!
    private var books = [BookModel]()
    private var cellToDeque: UICollectionViewCell.Type?
    
    // MARK: - Init
    init(with collectionView: UICollectionView, cellToDeque: UICollectionViewCell.Type, viewModel: LibraryCellsViewModelProtocol) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.viewModel = viewModel
        self.cellToDeque = cellToDeque
        
        
    }
    
    // MARK: - Refresh
    func refresh() {
        viewModel.fetchBooks { books in
            self.books = books
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
   
}

// MARK: - UICollectionView Data Source & Delegate
extension LibraryCellsDataSource: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellToDeque = cellToDeque else {return .init()}
        
        if cellToDeque == ReadingItemCell.self {
            let cell = collectionView.deque(ReadingItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        
        if cellToDeque == BookShelItemCell.self {
            let cell = collectionView.deque(BookShelItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        
        if cellToDeque == MyBooksItemCell.self {
            let cell = collectionView.deque(MyBooksItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        
        return .init()
    }

}

// MARK: - UICollectionView Delegate Flow Layout
extension LibraryCellsDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if cellToDeque == ReadingItemCell.self {
            return CGSize(width: 200, height: 400)
        }
            
        if cellToDeque == BookShelItemCell.self {
            return CGSize(width: 120, height: 249)
        }
        
        if cellToDeque == MyBooksItemCell.self {
            return CGSize(width: 335, height: 480)
        }
        
        return CGSize(width: 160, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}


