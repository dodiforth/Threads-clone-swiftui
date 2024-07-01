//
//  ThreadService.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 30/06/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadService {
    
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        return try snapshot.documents.compactMap { try $0.data(as: Thread.self) }
    }
    
    static func fetchUserThreads(uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        
        let threads = snapshot.documents.compactMap { try? $0.data(as: Thread.self) }
        return threads.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
    
}

// MARK: - Likes

extension ThreadService {
    static func likeThread(_ thread: Thread) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let threadRef = FirestoreConstants.ThreadCollection
            .document(thread.id)
        
        async let _ = try await threadRef
            .collection("thread-likes")
            .document(uid)
            .setData([:])
        async let _ = try await threadRef
            .updateData(["likes": thread.likes + 1])
        async let _ = try await FirestoreConstants.UserCollection.document(uid).collection("user-likes").document(thread.id).setData([:])
        
    }
    
    static func unlikeThread(_ thread: Thread) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let threadRef = FirestoreConstants.ThreadCollection.document(thread.id)
        
        async let _ = try await threadRef
            .collection("thread-likes")
            .document(uid)
            .delete()
        // Fetch the latest thread data to check the current number of likes
        let snapshot = try await threadRef.getDocument()
        if let data = snapshot.data(), let likes = data["likes"] as? Int, likes > 0 {
            async let _ = try await threadRef.updateData(["likes": likes - 1])
        }
        
        async let _ = try await FirestoreConstants.UserCollection.document(uid).collection("user-likes").document(thread.id).delete()
        
    }
    
    static func checkIfUserLikedThread(_ thread: Thread) async throws -> Bool {
        guard let uid = Auth.auth().currentUser?.uid else { return false }
        let userLikesRef = FirestoreConstants.UserCollection.document(uid)
            .collection("user-likes")
            .document(thread.id)
        
        let document = try await userLikesRef.getDocument()
        return document.exists
    }
}
