//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Weerawut Chaiyasomboon on 14/12/2567 BE.
//

import SwiftUI
import SwiftData

@main
struct BookWormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Review.self)
    }
}
