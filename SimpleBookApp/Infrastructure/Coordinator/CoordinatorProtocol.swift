//
//  CoordinatorProtocol.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func proceedToDetailPage(coordinator: CoordinatorProtocol) 

}

extension CoordinatorProtocol {
    
    func proceedToDetailPage(coordinator: CoordinatorProtocol) {}

}
