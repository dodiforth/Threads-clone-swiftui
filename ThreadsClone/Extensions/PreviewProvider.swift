//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 26/06/2024.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Dowon Kim", email: "dowonkim@me.com", username: "dowonkim")
    
    lazy var thread = Thread(
        ownerUid: "123",
        caption: "This is a text thread",
        timestamp: Timestamp(),
        likes: 37,
        replyCount: 5
    )
    
    lazy var reply = ThreadReply(
        threadId: "123",
        replyText: "This is a text reply",
        threadReplyOwnerUid: "123",
        threadOwneruid: "123",
        timestamp: Timestamp(),
        thread: thread,
        replyUser: user
    )
}
