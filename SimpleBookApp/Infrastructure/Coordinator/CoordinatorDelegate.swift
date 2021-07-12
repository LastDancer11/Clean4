//
//  CoordinatorDelegate.swift
//  SimpleBookApp
//
//  Created by user200328 on 12.07.21.
//

import UIKit

protocol CoordinatorDelegate: UIViewController{
    var coordinator: CoordinatorProtocol? { get set }
}
