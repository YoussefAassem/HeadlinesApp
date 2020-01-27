//
//  UIImageView.swift
//  NewsApp
//
//  Created by Youssef AASSEM on 1/18/20.
//  Copyright © 2020 Youssef AASSEM. All rights reserved.
//

import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
     func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func loadImage(urlString: String?) {
        guard let urlString = urlString else { return }
        if let cacheImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
                   self.image = cacheImage
                   return
               }
               
               guard let url = URL(string: urlString) else { return }
               
               URLSession.shared.dataTask(with: url) { (data, response, error) in
                   if let error = error {
                       print("Couldn't download image: ", error)
                       return
                   }
                   
                   guard let data = data else { return }
                   guard let image = UIImage(data: data) else { return }
                   imageCache.setObject(image, forKey: urlString as AnyObject)
                   
                   DispatchQueue.main.async {
                       self.image = image
                   }
               }.resume()

    }
}
