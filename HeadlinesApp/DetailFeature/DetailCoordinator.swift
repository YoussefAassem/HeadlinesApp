//
//  HeadlineDetailCoordinator.swift
//  NewsApp
//
//  Created by Youssef AASSEM on 1/17/20.
//  Copyright © 2020 Youssef AASSEM. All rights reserved.
//

import Foundation
import UIKit

class DetailCoordinator {

    private let formatter: DetailViewFormatter?
    private var view: DetailView?
    private var item: ItemViewData?
    
    init(newFormatter: DetailViewFormatter, newView: DetailView) {
        view = newView
        formatter = newFormatter
        view?.setDelegate(self)
    }
    func setItem(data: ItemViewData) {
        item = data
        updateView()
    }
    
    func updateView() {
        guard var item = item, let detailItem = formatter?.prepare(data: &item) else { return }
        view?.setViewData(detailItem)
    }
    
    func start(from previousView: UIViewController) {
        let vc = view as! UIViewController
        previousView.navigationController?.pushViewController(vc, animated: true)
    }
}

// View delegate method 
extension DetailCoordinator: DetailViewDelegate {
}
