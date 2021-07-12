//
//  BookManager.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import Foundation

protocol BooksManagerProtocol {
    func fetchBooks(completion: @escaping ([BookModel]) -> Void)
}

class BooksManager: BooksManagerProtocol {
    // MARK: - Fetch News
    func fetchBooks(completion: @escaping ([BookModel]) -> Void) {
        let urlString = "https://run.mocky.io/v3/0f23e7a0-e72a-43e8-b107-659e809eb0d0"

        NetworkManager.shared.get(url: urlString) { (result: Result<[BookModel], Error>) in
            switch result {
            case .success(let books):
                completion(books)
            case .failure(let error):
                print(error)
            }
        }
    }
}
