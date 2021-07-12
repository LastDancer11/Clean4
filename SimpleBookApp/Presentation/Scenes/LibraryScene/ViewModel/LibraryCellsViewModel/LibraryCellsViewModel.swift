//
//  LibraryCellsViewModel.swift
//  SimpleBookApp
//
//  Created by user200328 on 7/12/21.
//

import Foundation

protocol LibraryCellsViewModelProtocol {
    
    func fetchBooks(completion: @escaping ([BookModel]) -> Void)
        
    init(with booksManager: BooksManagerProtocol)
}

final class LibraryCellsViewModel: LibraryCellsViewModelProtocol {
    
    private let booksManager: BooksManagerProtocol
    
    init(with booksManager: BooksManagerProtocol) {
        self.booksManager = booksManager
    }
    
    func fetchBooks(completion: @escaping ([BookModel]) -> Void) {
        booksManager.fetchBooks(completion: completion)
    }
    
}

