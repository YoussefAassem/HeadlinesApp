//
//  ViewData.swift
//  HeadlinesApp
//
//  Created by Youssef AASSEM on 1/20/20.
//  Copyright © 2020 Youssef AASSEM. All rights reserved.
//

import Foundation

// MARK: View Data

struct ItemViewData {
    let title: String?
    var image: String?
    let author: String?
    let description: String?
    var publicationDate: String?
    
    init(title: String?, authr: String?, descript: String?, date: String?, imageURL: String?) {
        self.title = title
        author = authr
        description = descript
        publicationDate = date
        image = imageURL
    }
}
struct ListViewData {
    private var items: [ItemViewData] = []
    var count: Int { return items.count }
    
    mutating func append(item: ItemViewData) {
        self.items.append(item)
    }
    subscript(index: Int) -> ItemViewData {
        return items[index]
    }
    
}

