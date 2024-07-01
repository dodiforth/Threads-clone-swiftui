//
//  ContentActionButtonsViewModel.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 01/07/2024.
//

import Foundation

class ContentActionButtonsViewModel: ObservableObject {
    @Published var thread : Thread
    
    init(thread: Thread) {
        self.thread = thread
    }
    
    func likeThread() async throws {
        try await ThreadService.likeThread(thread)
        self.thread.didLike = true
        self.thread.likes += 1
    }
    
    func unlikeThread() {
        self.thread.didLike = false
    }
}
