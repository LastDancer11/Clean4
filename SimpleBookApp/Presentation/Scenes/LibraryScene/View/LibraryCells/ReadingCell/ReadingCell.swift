//
//  LibraryCell.swift
//  SimpleBookApp
//
//  Created by user200328 on 7/12/21.
//

import UIKit

class ReadingCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: LibraryCellsDataSource!
    private var booksManager: BooksManagerProtocol!
    private var viewModel: LibraryCellsViewModelProtocol!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure() {
        configureDataSource()
    }
    
    // MARK: - Setup
    private func setupLayout() {
        collectionView.registerNib(class: ReadingItemCell.self)
    }
    
    private func configureDataSource() {
        booksManager = BooksManager()
        viewModel = LibraryCellsViewModel(with: booksManager)
        dataSource = LibraryCellsDataSource(with: collectionView, cellToDeque: ReadingItemCell.self, viewModel: viewModel)
        dataSource.refresh()
    }
    
}
