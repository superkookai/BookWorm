//
//  Review.swift
//  BookWorm
//
//  Created by Weerawut Chaiyasomboon on 14/12/2567 BE.
//

import Foundation
import SwiftData

@Model
class Review {
    var title: String
    var author: String
    var rating: Int
    var text: String
    var date: Date

    init(title: String, author: String, rating: Int, text: String, date: Date) {
        self.title = title
        self.author = author
        self.rating = rating
        self.text = text
        self.date = date
    }
}
