//
//  HeadlineListInteractor.swift
//  NewsApp
//
//  Created by Youssef AASSEM on 1/17/20.
//  Copyright © 2020 Youssef AASSEM. All rights reserved.
//

protocol ListInteractorProtocol {
    func retrieveNews()
    func setDelegate(_ delegate: ListInteractorDelegate)
}

protocol ListInteractorDelegate: class {
    func didFetchArticles(with articles: [Article])
}


class ListInteractor: ListInteractorProtocol {
    weak var delegate: ListInteractorDelegate?
    var listService: ListServiceProtocol
    
    init(service: ListServiceProtocol) {
        listService = service
    }
    func setDelegate(_ delegate: ListInteractorDelegate) {
        self.delegate = delegate
    }
    func retrieveNews() {
        listService.retrieveNews { articlesArray in
            self.delegate?.didFetchArticles(with: articlesArray)
        }
    }
}
