//
//  HeadlineListCoordinator.swift
//  NewsApp
//
//  Created by Youssef AASSEM on 1/17/20.
//  Copyright © 2020 Youssef AASSEM. All rights reserved.
//
import UIKit

class ListCoordinator {
    
    struct Dependencies {
        var view: ListViewProtocol
        let interactor: ListInteractorProtocol
        let formatter: ListFormatterProtocol
        let detailCoordinator: DetailCoordinator
    }
    
    private var deps: Dependencies
    
    init(dependencies: Dependencies) {
        deps = dependencies
        deps.view.setDelegate(self)
        deps.interactor.setDelegate(self)
    }
    
    func start() -> UIViewController? {
        return deps.view as? UIViewController
    }
    func getView() -> UIViewController? {
        return deps.view as? UIViewController
    }
}


// MARK: Flow Coordinator -> View
extension ListCoordinator: ListViewDelegate {
    func viewReady() {
        deps.interactor.retrieveNews()
    }
    
    func didSelectHeadline(headline: ItemViewData) {
        deps.detailCoordinator.setItem(data: headline)
        deps.detailCoordinator.start(from: deps.view as! UIViewController)
    }
}

// MARK: Flow Interactor -> Coordinator
extension ListCoordinator: ListInteractorDelegate {
    
    func didFetchArticles(with articles: [Article]) {
       let viewData = deps.formatter.prepareData(articles: articles)
        deps.view.updateView(with: viewData)
    }
}
