//
//  MainCell.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: CellsDataSource!
    private var booksManager: BooksManagerProtocol!
    private var viewModel: CellsViewModelProtocol!

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
        collectionView.registerNib(class: MainItemCell.self)
    }
    
    private func configureDataSource() {
        booksManager = BooksManager()
        viewModel = CellsViewModel(with: booksManager)
        dataSource = CellsDataSource(with: collectionView, cellToDeque: MainItemCell.self, viewModel: viewModel)
        dataSource.refresh()
    }
    
}
