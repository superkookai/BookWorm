//
//  ContentView.swift
//  BookWorm
//
//  Created by Weerawut Chaiyasomboon on 14/12/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedReview: Review?
    
    var body: some View {
        NavigationSplitView {
            ListingView(selectedReview: $selectedReview)
                .frame(minWidth: 250)
        } detail: {
            if let selectedReview {
                DetailView(review: selectedReview)
            }else{
                Text("Please select a Review")
            }
        }

    }
}

#Preview {
    ContentView()
}
