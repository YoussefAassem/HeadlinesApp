//
//  HeadlineViewData.swift
//  NewsApp
//
//  Created by Youssef AASSEM on 1/17/20.
//  Copyright © 2020 Youssef AASSEM. All rights reserved.
//

import Foundation

struct Article {
    let title: String?
    let urlImage: String?
    let author: String?
    let description: String?
    var publicationDate: String?
    
    enum CodingKeys: String, CodingKey {
        case title 
        case urlImage = "urlToImage"
        case author
        case description
        case publicationDate = "publishedAt"
    }
}

extension Article: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(urlImage, forKey: .urlImage)
        try container.encode(author, forKey: .author)
        try container.encode(description, forKey: .description)
        try container.encode(publicationDate, forKey: .publicationDate)
    }

}

extension Article: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        urlImage = try values.decodeIfPresent(String.self, forKey: .urlImage)
        author = try values.decode(String.self, forKey: .author)
        description = try values.decode(String.self, forKey: .description)
        publicationDate = try values.decode(String.self, forKey: .publicationDate)
    }
}

struct ApiResponse: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case totalResults = "totalResults"
        case articles = "articles"
    }
}
