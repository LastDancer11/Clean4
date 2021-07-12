//
//  LibraryViewController.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import UIKit

class LibraryViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: LibraryDataSource!
    private var booksManager: BooksManagerProtocol!
    private var viewModel:  LibraryViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        setupLayout()
        configureViewModel()
    }
    
    private func setupLayout() {
        collectionView.registerNib(class: LibraryCategoryCell.self)
        tableView.registerNib(class: ReadingCell.self)
        tableView.registerNib(class: BookShelCell.self)
        tableView.registerNib(class: MyBooksCell.self)
    }
        
    private func configureViewModel() {
        booksManager = BooksManager()
        viewModel = LibraryViewModel(with: booksManager)
        dataSource = LibraryDataSource(with: tableView,collectionView: collectionView, viewModel: viewModel)
    }
    
}
