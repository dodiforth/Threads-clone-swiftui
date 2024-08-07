//
//  Thread.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 30/06/2024.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Hashable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var replyCount: Int
    
    var didLike: Bool? = false
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    var user: User?    
}
