//
//  ListingView.swift
//  BookWorm
//
//  Created by Weerawut Chaiyasomboon on 14/12/2567 BE.
//

import SwiftUI
import SwiftData

struct ListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Review.date) var reviews: [Review]
    @Binding var selectedReview: Review?
    
    var body: some View {
        List(reviews, selection: $selectedReview) { review in
            VStack(alignment: .leading) {
                Text(review.title)
                StarRatingView(rating: review.rating)
                    .font(.caption)
            }
            .tag(review)
            .contextMenu {
                Button("Delete", role: .destructive, action: deleteSelected)
            }
        }
        .toolbar {
            Button("Add Review", systemImage: "plus") {
                addReview()
            }
            
            Button("Delete", systemImage: "trash", action: deleteSelected)
                .disabled(selectedReview == nil)
        }
    }
    
    func addReview() {
        let review = Review(title: "Enter the title", author: "Enter the author", rating: 3, text: "", date: .now)
        modelContext.insert(review)
        selectedReview = review
    }
    
    func deleteSelected() {
        guard let selected = selectedReview else { return }
        guard let selectedIndex = reviews.firstIndex(of: selected) else { return }
        modelContext.delete(selected)
        try? modelContext.save()
        
//        if selectedIndex < reviews.count - 1 {
//            selectedReview = reviews[selectedIndex]
//        } else {
//            let previousIndex = selectedIndex
//            
//            if previousIndex >= 0 {
//                selectedReview = reviews[previousIndex]
//            }
//        }
    }
}

#Preview {
    ListingView(selectedReview: .constant(nil))
}
