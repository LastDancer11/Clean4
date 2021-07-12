//
//  CellsDataSource.swift
//  SimpleBookApp
//
//  Created by user200328 on 7/12/21.
//

import UIKit

class CellsDataSource: NSObject{
    
    // MARK: - Variables
    private var collectionView: UICollectionView!
    private var viewModel: CellsViewModelProtocol!
    private var books = [BookModel]()
    private var cellToDeque: UICollectionViewCell.Type?
    
    // MARK: - Init
    init(with collectionView: UICollectionView, cellToDeque: UICollectionViewCell.Type, viewModel: CellsViewModelProtocol) {
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
                self.scrollToSecondItem()
            }
        }
    }
    
    // MARK: - Helpers
    private func scrollToSecondItem() {
        if cellToDeque == MainItemCell.self {
            let scrollIndexPath = IndexPath(item: 2, section: 0)
            collectionView.scrollToItem(at: scrollIndexPath, at: [.centeredVertically, .centeredHorizontally], animated: false)
        }
    }
   
}

// MARK: - UICollectionView Data Source & Delegate
extension CellsDataSource: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellToDeque = cellToDeque else {return .init()}
        
        if cellToDeque == MainItemCell.self {
            let cell = collectionView.deque(MainItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        
        if cellToDeque == StoryItemCell.self {
            let cell = collectionView.deque(StoryItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        
        if cellToDeque == BestsellingItemCell.self {
            let cell = collectionView.deque(BestsellingItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        
        if cellToDeque == SeriesItemCell.self {
            let cell = collectionView.deque(SeriesItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        
        if cellToDeque == FriendReadingItemCell.self {
            let cell = collectionView.deque(FriendReadingItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        
        if cellToDeque == AudioBooksItemCell.self {
            let cell = collectionView.deque(AudioBooksItemCell.self, for: indexPath)
            
            return cell
        }
        
        if cellToDeque == AlsoLikeItemCell.self {
            let cell = collectionView.deque(AlsoLikeItemCell.self, for: indexPath)
            
            return cell
        }
        
        if cellToDeque == NewReleasesItemCell.self {
            let cell = collectionView.deque(NewReleasesItemCell.self, for: indexPath)
            
            return cell
        }
        
        if cellToDeque == ComingSoonItemCell.self {
            let cell = collectionView.deque(ComingSoonItemCell.self, for: indexPath)
            
            return cell
        }
        
        return .init()
    }

}

// MARK: - UICollectionView Delegate Flow Layout
extension CellsDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if cellToDeque == MainItemCell.self {
            return CGSize(width: 160, height: 240)
        }
            
        if cellToDeque == StoryItemCell.self {
            return CGSize(width: 120, height: 210)
        }
        
        if cellToDeque == BestsellingItemCell.self {
            return CGSize(width: 120, height: 294)
        }
        
        if cellToDeque == SeriesItemCell.self {
            return CGSize(width: 320, height: 240)
        }
        
        if cellToDeque == FriendReadingItemCell.self {
            return CGSize(width: 320, height: 260)
        }
        
        return CGSize(width: 160, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if cellToDeque == StoryItemCell.self {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
        
        if cellToDeque == BestsellingItemCell.self {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
        
        if cellToDeque == SeriesItemCell.self {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
        
        if cellToDeque == FriendReadingItemCell.self {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
        
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if cellToDeque == MainItemCell.self {
            return 66
        }
        
        if cellToDeque == StoryItemCell.self {
            return 20
        }
        
        if cellToDeque == BestsellingItemCell.self {
            return 20
        }
        
        return 10
    }
    
}

