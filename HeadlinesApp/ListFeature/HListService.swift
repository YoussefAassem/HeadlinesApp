//
//  HeadlineListService.swift
//  NewsApp
//
//  Created by Youssef AASSEM on 1/17/20.
//  Copyright © 2020 Youssef AASSEM. All rights reserved.
//
import Foundation


typealias completionHandler =  ([Article]) -> Void

protocol ListServiceProtocol {
    func retrieveNews(completion: @escaping completionHandler)
}

class HListService: ListServiceProtocol {
    let newsURL = "https://newsapi.org/v2/top-headlines?sources=the-next-web&apiKey=1e720f9e9cd845bea37152f911eb5dd9"
    
    func retrieveNews(completion: @escaping completionHandler) {
        guard let endpointUrl = URL(string: newsURL) else { return }
        URLSession.shared.dataTask(with: endpointUrl) { (data, response,error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let dataResponse = try decoder.decode(ApiResponse.self, from: data)
                guard let articlesArray = dataResponse.articles else { return }
                completion(articlesArray)
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
}

