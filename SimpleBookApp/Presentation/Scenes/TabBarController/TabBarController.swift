//
//  TabBarController.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import UIKit

class TabBarController: UITabBarController, Storyboarded, CoordinatorDelegate {

    
    var coordinator: CoordinatorProtocol?
    
    private var homeCoordinator = HomeCoordinator()
    private var feedCoordinator = FeedCoordinator()
   // private var searchCoordinator = SearchCoordinator()
    private var libraryCoordinator = LibraryCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewControllers![3] = libraryCoordinator.navigationController!
        
    }

}
