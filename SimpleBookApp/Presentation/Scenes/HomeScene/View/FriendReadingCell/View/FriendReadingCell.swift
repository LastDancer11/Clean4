//
//  FriendReadingCell.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import UIKit

class FriendReadingCell: UITableViewCell {
    
    @IBOutlet weak var friendReadingLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: CellsDataSource!
    private var viewModel: CellsViewModelProtocol!
    private var booksManager: BooksManagerProtocol!

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
    
    private func setupLayout() {
        collectionView.registerNib(class: FriendReadingItemCell.self)
    }
    
    private func configureDataSource() {
        booksManager = BooksManager()
        viewModel = CellsViewModel(with: booksManager)
        dataSource = CellsDataSource(with: collectionView, cellToDeque: FriendReadingItemCell.self, viewModel: viewModel)
        dataSource.refresh()
    }
    
}
