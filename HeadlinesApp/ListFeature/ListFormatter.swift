//
//  HeadlineListFormatter.swift
//  NewsApp
//
//  Created by Youssef AASSEM on 1/17/20.
//  Copyright © 2020 Youssef AASSEM. All rights reserved.
//

protocol ListFormatterProtocol {
    func prepareData(articles: [Article]) -> ListViewData
}


class ListFormatter: ListFormatterProtocol {
    
    func prepareData(articles: [Article]) -> ListViewData {
        var listViewData = ListViewData()
        for article in articles {
        let item = ItemViewData(title: article.title, authr: article.author, descript: article.description, date: article.publicationDate, imageURL: article.urlImage)
            listViewData.append(item: item)
        }
        return listViewData
    }
}
