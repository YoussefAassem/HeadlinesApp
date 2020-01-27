//
//  AppCoordinator.swift
//  HeadlinesApp
//
//  Created by Youssef AASSEM on 1/19/20.
//  Copyright © 2020 Youssef AASSEM. All rights reserved.
//

import Foundation

import UIKit

class AppCoordinator {
    var navController: UINavigationController?
    let coordinator: ListCoordinator
    
    init() {
        coordinator = ListFeature.makeHeadlineListCoordinator()
    }
    func start(window: UIWindow)  {
        let view = coordinator.start()
        
        guard let viewController = view else { return }
        navController = UINavigationController(rootViewController: viewController)
        navController?.navigationBar.topItem?.title = "Top Headlines"
        
        window.rootViewController = navController
    }
    
    
    deinit {
        print("App coordinator deinit")
    }
}
