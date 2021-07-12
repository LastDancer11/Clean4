//
//  BookShelCell.swift
//  SimpleBookApp
//
//  Created by user200328 on 7/12/21.
//

import UIKit

class BookShelCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
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
    
    func configure(with categoryName: String) {
        categoryNameLabel.text = categoryName
        configureDataSource()
    }
    
    // MARK: - Setup
    private func setupLayout() {
        collectionView.registerNib(class: BookShelItemCell.self)
    }
    
    private func configureDataSource() {
        booksManager = BooksManager()
        viewModel = LibraryCellsViewModel(with: booksManager)
        dataSource = LibraryCellsDataSource(with: collectionView, cellToDeque: BookShelItemCell.self, viewModel: viewModel)
        dataSource.refresh()
    }
    
}
