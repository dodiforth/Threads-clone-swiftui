//
//  ContentActionButtonsView.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 01/07/2024.
//

import SwiftUI

struct ContentActionButtonsView: View {
    var body: some View {
        HStack(spacing: 16){
            Button {
                
            } label: {
                Image(systemName: "heart")
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
        ContentActionButtonsView()
    }
}
