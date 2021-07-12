//
//  SeriesCell.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import UIKit

class SeriesCell: UITableViewCell {

    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Private Variables
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
    
    // MARK: - Setup
    private func setupLayout() {
        collectionView.registerNib(class: SeriesItemCell.self)
    }
    
    private func configureDataSource() {
        booksManager = BooksManager()
        viewModel = CellsViewModel(with: booksManager)
        dataSource = CellsDataSource(with: collectionView, cellToDeque: SeriesItemCell.self, viewModel: viewModel)
        dataSource.refresh()
    }
    
}

