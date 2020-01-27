//
//  HeadlineListFeature.swift
//  NewsApp
//
//  Created by Youssef AASSEM on 1/17/20.
//  Copyright © 2020 Youssef AASSEM. All rights reserved.
//
import Foundation

class ListFeature {
    
    // Service class can be initialized within the interactor class
    class func makeHeadlineListCoordinator() -> ListCoordinator {
        let service: ListServiceProtocol = HListService()
        let formatter: ListFormatterProtocol = ListFormatter()
        let interactor = ListInteractor(service: service)
        let view = ListViewController.makeView()
        let detailCoordinator = DetailViewFeature.makeHeadlineDetailCoordinator()
        let coordDependencies = ListCoordinator.Dependencies(
            view: view,
            interactor: interactor,
            formatter: formatter,
            detailCoordinator: detailCoordinator
        )
        return ListCoordinator(dependencies: coordDependencies)
    }
}
