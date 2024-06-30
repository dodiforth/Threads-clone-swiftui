//
//  FeedViewModel.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 30/06/2024.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    
    @Published var threads = [Thread]()
    
    init() {
        Task { try await fetchThreads() }
    }
    
    private func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserDataForThreads()
    }
    
    private func fetchUserDataForThreads() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadUser = try await UserService.fetchUser(withUid: ownerUid)
            
            threads[i].user = threadUser
        }
    }
}