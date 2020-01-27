//
//  ListViewController.swift
//  NewsApp
//
//  Created by Youssef AASSEM on 1/17/20.
//  Copyright © 2020 Youssef AASSEM. All rights reserved.
//
import UIKit


// MARK: Protocols
protocol ListViewFactoryProtocol {
   static func makeView() -> ListViewProtocol
}

protocol ListViewProtocol {
    var delegate: ListViewDelegate? { get set }
    func updateView(with data: ListViewData)
    func setDelegate(_ viewDelegate: ListViewDelegate)
}
protocol ListViewDelegate: AnyObject {
    func viewReady()
    func didSelectHeadline(headline: ItemViewData)
}


// MARK: List view ViewController
class ListViewController: UIViewController, ListViewProtocol {
    
    weak var delegate: ListViewDelegate?
    var viewData: ListViewData?
    
    @IBOutlet weak var collectionView: UICollectionView?
    var cellIdentifier = "Cell"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        delegate?.viewReady()
    }
    
    func updateView(with data: ListViewData) {
        viewData = data
        DispatchQueue.main.async {
              self.collectionView?.reloadData()
        }
      
    }
    private func setupView() {
        collectionView?.register(UINib(nibName: "HeadlineCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: cellIdentifier)
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    
    func setDelegate(_ viewDelegate: ListViewDelegate) {
        delegate = viewDelegate
    }

}


// MARK: Collection View datasource & delegate
extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! HCollectionViewCell
        if let element = viewData?[indexPath.row] { cell.setupCell(for: element) }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = viewData?[indexPath.row] else { return }
        delegate?.didSelectHeadline(headline: item)
    }
}
// MARK: Collection View Layout
extension ListViewController: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.bounds.width * (2/3), height: collectionView.bounds.height)
    }
}

// MARK: Factory Method 
extension ListViewController: ListViewFactoryProtocol {
    static func makeView() -> ListViewProtocol {
        let view = ListViewController(nibName: "ListViewController", bundle: nil)
        return view
    }
}



