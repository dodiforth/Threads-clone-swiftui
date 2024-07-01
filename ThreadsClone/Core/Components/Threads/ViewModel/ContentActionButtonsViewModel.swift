//
//  ContentActionButtonsViewModel.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 01/07/2024.
//

import Foundation

@MainActor
class ContentActionButtonsViewModel: ObservableObject {
    @Published var thread : Thread
    
    init(thread: Thread) {
        self.thread = thread
        Task { try await checkIfUserLikedThread() }
    }
    
    func likeThread() async throws {
        try await ThreadService.likeThread(thread)
        self.thread.didLike = true
        self.thread.likes += 1
    }
    
    func unlikeThread() async throws {
        try await ThreadService.unlikeThread(thread)
        self.thread.didLike = false
        self.thread.likes -= 1
    }
    
    func checkIfUserLikedThread() async throws {
        let didLike = try await ThreadService.checkIfUserLikedThread(thread)
        
        // Only execute update if thread has been like
        if didLike {
            self.thread.didLike = true
        }
    }
    
}
