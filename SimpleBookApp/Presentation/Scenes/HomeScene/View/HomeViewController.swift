//
//  HomeViewController.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: HomeDataSource!
    private var booksManager: BooksManagerProtocol!
    private var viewModel:  HomeViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        setupLayout()
        configureViewModel()
    }
    
    private func setupLayout() {
        tableView.registerNib(class: MainCell.self)
        tableView.registerNib(class: StoryCell.self)
        tableView.registerNib(class: BestsellingCell.self)
        tableView.registerNib(class: SeriesCell.self)
        tableView.registerNib(class: FriendReadingCell.self)
        tableView.registerNib(class: AudioBooksCell.self)
        tableView.registerNib(class: AlsoLikeCell.self)
        tableView.registerNib(class: NewReleasesCell.self)
        tableView.registerNib(class: ComingSoonCell.self)
    }
    
    private func configureViewModel() {
        booksManager = BooksManager()
        viewModel = HomeViewModel(with: booksManager)
        dataSource = HomeDataSource(with: tableView, viewModel: viewModel)
    }

}
