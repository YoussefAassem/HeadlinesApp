//
//  HeadlineDetailFormatter.swift
//  NewsApp
//
//  Created by Youssef AASSEM on 1/17/20.
//  Copyright © 2020 Youssef AASSEM. All rights reserved.
//
import Foundation

protocol DetailViewFormatter {
    func prepare(data: inout ItemViewData) -> ItemViewData
}

class HDetailFormatter: DetailViewFormatter {
    
     func prepare(data: inout ItemViewData) -> ItemViewData {
        data.publicationDate = formatDate(data.publicationDate)
        return data
    }
    
    private func formatDate(_ date: String?) -> String? {
        guard let date = date else { return nil }
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "EEEE, MMM d, yyyy"
        
        if let date = dateFormatterGet.date(from: date) {
            return dateFormatterPrint.string(from: date)
        }
        
        return nil
    }
}
