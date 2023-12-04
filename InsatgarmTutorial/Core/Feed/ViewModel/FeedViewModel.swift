//
//  FeedViewModel.swift
//  InsatgarmTutorial
//
//  Created by Oğuz Kanda on 4.12.2023.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    init() {
        Task {try await fetchPosts()}
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    
    }
    
}
