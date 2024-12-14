//
//  RenderView.swift
//  BookWorm
//
//  Created by Weerawut Chaiyasomboon on 14/12/2567 BE.
//

import SwiftUI

struct RenderView: View {
    let review: Review
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 10) {
            Text(review.title)
                .font(.system(.largeTitle, design: .serif))
            
            Text("by \(review.author)")
                .font(.system(.title, design: .serif))
                .italic()
            
            Text("\(review.date, format: Date.FormatStyle(date: .complete))")
            
            StarRatingView(rating: review.rating)
            
            ScrollView {
                Text(review.text)
                    .fontDesign(.serif)
                    .padding(.vertical)
            }
            
            Spacer()
                .frame(height: 50)
            
            Button("Done") {
                // dismiss the view
                dismiss()
            }
        }
        .frame(maxWidth: 800)
        .padding(25)
        
    }
}

#Preview {
    RenderView(review: Review(title: "The book", author: "Joe", rating: 3, text: "XXXYYY", date: .now))
}
