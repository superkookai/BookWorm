//
//  StarRatingView.swift
//  BookWorm
//
//  Created by Weerawut Chaiyasomboon on 14/12/2567 BE.
//

import SwiftUI

struct StarRatingView: View{
    let rating: Int
    var body: some View{
        HStack {
            ForEach(1..<6) { number in
                Image(systemName: "star.fill")
                    .foregroundStyle(number > rating ? .gray : .yellow)
            }
        }
    }
}

#Preview {
    StarRatingView(rating: 3)
}
