//
//  ThreadDetailsViewModel.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 02/07/2024.
//

import Foundation

@MainActor
class ThreadDetailsViewModel: ObservableObject {
    @Published var replies = [ThreadReply]()
    
    private let thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
        Task { try await fetchThreadReplies() }
    }
    
    private func fetchThreadReplies() async throws {
        self.replies = try await ThreadReplyService.fetchThreadReplies(forThread: thread)
        try await fetchUserDataForReplies()
    }

    private func fetchUserDataForReplies() async throws {
        for i in 0 ..< replies.count {
            let reply = replies[i]
            
            async let user = try await UserService.fetchUser(withUid: reply.threadReplyOwnerUid)
            self.replies[i].replyUser = try await user
        }
    }
    
}
