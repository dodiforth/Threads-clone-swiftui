//
//  Constants.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 01/07/2024.
//

import Firebase

struct FirestoreConstants {
    
    private static let Root = Firestore.firestore()
    
    static let UserCollection = Root.collection("users")
    static let ThreadCollection = Root.collection("threads")
    
    static let FollowersCollection = Root.collection("followers")
    static let FollowingCollection = Root.collection("following")
    
    static let RepliesCollection = Root.collection("replies")
    static let ActivityCollection = Root.collection("activity")
}
