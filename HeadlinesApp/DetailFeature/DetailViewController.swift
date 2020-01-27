//
//  HeadlineDetailViewController.swift
//  NewsApp
//
//  Created by Youssef AASSEM on 1/17/20.
//  Copyright © 2020 Youssef AASSEM. All rights reserved.
//

import UIKit



protocol DetailViewFactory {
   static func make() -> DetailView
}

protocol DetailView {
   func setDelegate(_ delegate: DetailViewDelegate)
   func setViewData(_ newViewData: ItemViewData)
}

protocol DetailViewDelegate: class {}

class DetailViewController: UIViewController, DetailView {

    private var delegate: DetailViewDelegate?
    private var viewData: ItemViewData?
    // MARK: Outlets
    @IBOutlet weak var authorLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var descriptionTextLabel: UILabel?
    
    private func updateView() {
        authorLabel?.text = viewData?.author
        dateLabel?.text = viewData?.publicationDate
        self.imageView?.loadImage(urlString: viewData?.image)
        titleLabel?.text = viewData?.title
        descriptionTextLabel?.text = viewData?.description
    }
    
    private func setupView() {
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.numberOfLines = 0
        descriptionTextLabel?.lineBreakMode = .byWordWrapping
        descriptionTextLabel?.numberOfLines = 0
        imageView?.layer.cornerRadius = 8
        imageView?.layer.masksToBounds = true 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateView()
    }
    
    func setDelegate(_ delegate: DetailViewDelegate) {
        self.delegate = delegate
    }
    
    func setViewData(_ newViewData: ItemViewData) {
        viewData = newViewData
    }

}

extension DetailViewController: DetailViewFactory {
    
    static func make() -> DetailView {
        let view = DetailViewController(nibName: "HeadlineDetailViewController", bundle: nil)
        return view
    }
}

