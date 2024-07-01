//
//  ThreadReplyView.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 01/07/2024.
//

import SwiftUI

struct ThreadReplyView: View {
    
    let thread: Thread
    @State private var replyText = ""
    @Environment(\.dismiss) var dismiss
    private var currentUser: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                
                VStack(alignment: .leading, spacing: 12){
                    HStack(alignment: .top){
                        VStack{
                            CircularProfileImageView(user: thread.user, size: .small)
                            
                            Rectangle()
                                .frame(width: 2, height: 50)
                                .foregroundColor(Color(.systemGray4))
                        }
                        
                        VStack(alignment: .leading, spacing: 2){
                            Text(thread.user?.username ?? "")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(thread.caption)
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                        }
                        .font(.footnote)
                        
                        Spacer()
                        
                    }
                    
                    HStack(alignment: .top) {
                        CircularProfileImageView(user: currentUser, size: .small)
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text(currentUser?.username ?? "")
                            
                            TextField("Add your reply...", text: $replyText, axis: .vertical)
                                .multilineTextAlignment(.leading)
                                .font(.footnote)
                                .autocorrectionDisabled()
                        }
                    }
                }
                .padding()

                Spacer()
            }
            .navigationTitle("Reply")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        dismiss()
                    }
                    .opacity(replyText.isEmpty ? 0.5 : 1.0)
                    .disabled(replyText.isEmpty)
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct ThreadReplyView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadReplyView(thread: dev.thread)
    }
}
