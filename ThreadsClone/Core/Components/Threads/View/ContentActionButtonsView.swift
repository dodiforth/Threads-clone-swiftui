//
//  ContentActionButtonsView.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 01/07/2024.
//

import SwiftUI

struct ContentActionButtonsView: View {
    @ObservedObject var viewModel : ContentActionButtonsViewModel
    
    init(thread: Thread) {
        self.viewModel = ContentActionButtonsViewModel(thread: thread)
    }
    
    private var didLike: Bool {
        return viewModel.thread.didLike ?? false
    }
    
    func handleLikeTapped() {
        Task {
            if didLike {
                viewModel.unlikeThread()
            } else {
                try await viewModel.likeThread()
            }
        }
    }
    
    var body: some View {
        HStack(spacing: 16){
            Button {
                handleLikeTapped()
            } label: {
                Image(systemName: didLike ? "heart.fill" : "heart")
                    .foregroundColor(didLike ? .red : .black)
            }
            Button {
                
            } label: {
                Image(systemName: "bubble.right")
            }
            Button {
                
            } label: {
                Image(systemName: "arrow.rectanglepath")
            }
            Button {
                
            } label: {
                Image(systemName: "paperplane")
            }
        }
    }
}

struct ContentActionButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentActionButtonsView(thread: dev.thread)
    }
}
