//
//  ThreadReplyService.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 02/07/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadReplyService {
    
    static func uploadThreadReply(_ reply: ThreadReply, toThread thread: Thread) async throws {
        guard let replyData = try? Firestore.Encoder().encode(reply) else { return }
        
        async let _ = try await FirestoreConstants.RepliesCollection.document().setData(replyData)
        async let _ = try await FirestoreConstants.ThreadCollection.document(thread.id).updateData(["replyCount": thread.replyCount + 1])
    }
    
    static func fetchThreadReplies(forThread thread: Thread) async throws -> [ThreadReply] {
        let snapshot = try await FirestoreConstants.RepliesCollection
            .whereField("threadId", isEqualTo: thread.id)
            .getDocuments()
        return try snapshot.documents.compactMap { try $0.data(as: ThreadReply.self) }
    }
    
    static func fetchThreadReplies(forUser user: User) async throws -> [ThreadReply] {
        let snapshot = try await FirestoreConstants.RepliesCollection
            .whereField("threadOwnerUid", isEqualTo: user.id)
            .getDocuments()
        return try snapshot.documents.compactMap { try $0.data(as: ThreadReply.self) }
    }
}
