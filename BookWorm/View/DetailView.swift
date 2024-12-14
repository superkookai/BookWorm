//
//  DetailView.swift
//  BookWorm
//
//  Created by Weerawut Chaiyasomboon on 14/12/2567 BE.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @Bindable var review: Review
    @State private var showRenderView = false
    
    var body: some View {
        Form{
            TextField("Title", text: $review.title)
            TextField("Author", text: $review.author)
            Picker("Rating", selection: $review.rating) {
                ForEach(1..<6){
                    Text(String($0))
                        .tag($0)
                }
            }
            .pickerStyle(.segmented)
            
            TextEditor(text: $review.text)
        }
        .toolbar {
            Button("Show rendered", systemImage: "book") {
                showRenderView.toggle()
            }
        }
        .sheet(isPresented: $showRenderView) {
            RenderView(review: review)
        }
    }
}

#Preview {
    do {
        // Store preview data in RAM so it gets cleared automatically.
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        // Create our model container from the custom configuration.
        let container = try ModelContainer(for: Review.self, configurations: config)
        // Now it's safe to create our Review object.
        let review = Review(title: "Example title", author: "Example author", rating: 4, text: "Example review goes here", date: .now)
        
        // Pass our custom container into the view.
        return DetailView(review: review)
                    .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
