//
//  FeedCoordinator.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import UIKit

final class FeedCoordinator: CoordinatorProtocol {

    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        
        let vc = FeedViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic_feed")
        vc.title = "Feed"
        
        self.navigationController?.viewControllers = [vc]
    }
    
    func start() {
        
    }
    
    func proceedToProducts() {
        print("I am now concrete implemented")
    }
}
