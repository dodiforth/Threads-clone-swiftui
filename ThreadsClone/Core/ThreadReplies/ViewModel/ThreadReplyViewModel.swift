//
//  ThreadReplyViewModel.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 02/07/2024.
//

import Foundation
import Firebase

class ThreadReplyViewModel: ObservableObject {
    
    func uploadThreadReply(replyText: String, thread: Thread) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let reply = ThreadReply(threadId: thread.id, 
                                replyText: replyText,
                                threadReplyOwnerUid: uid,
                                threadOwneruid: thread.ownerUid,
                                timestamp: Timestamp()
        )
        
        try await ThreadReplyService.uploadThreadReply(reply, toThread: thread)
        
    }
    
}
