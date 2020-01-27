//
//  HeadlineDetailViewFeature.swift
//  HeadlinesApp
//
//  Created by Youssef AASSEM on 1/19/20.
//  Copyright © 2020 Youssef AASSEM. All rights reserved.
//

import Foundation



class DetailViewFeature {
    class func makeHeadlineDetailCoordinator() -> DetailCoordinator {
       let view = DetailViewController.make()
        let formatter = HDetailFormatter()
        return DetailCoordinator(newFormatter: formatter, newView: view)
    }

}
