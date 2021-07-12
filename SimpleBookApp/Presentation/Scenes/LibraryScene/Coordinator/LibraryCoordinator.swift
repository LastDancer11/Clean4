//
//  LibraryCoordinator.swift
//  SimpleBookApp
//
//  Created by user200328 on 7/12/21.
//

import UIKit

final class LibraryCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        
        
        let vc = LibraryViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.viewControllers = [vc]
    }
    
    func start() {
        
    }

}

