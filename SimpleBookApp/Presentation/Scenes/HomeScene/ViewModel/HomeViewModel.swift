//
//  HomeViewModel.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import Foundation

protocol HomeViewModelProtocol {
    
    func fetchBooks(completion: @escaping ([BookModel]) -> Void)
    
    init(with booksManager: BooksManagerProtocol)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    private let booksManager: BooksManagerProtocol
    
    init(with booksManager: BooksManagerProtocol) {
        self.booksManager = booksManager
    }
    
    func fetchBooks(completion: @escaping ([BookModel]) -> Void) {
        booksManager.fetchBooks(completion: completion)
    }
    
}
