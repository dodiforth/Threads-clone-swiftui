//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 23/03/2024.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12){
                CircularProfileImageView()
                VStack(alignment: .leading, spacing: 4){
                    
                    HStack(){
                        Text("dodinoyo")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    
                    Text("Award Winning Cat Owner")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
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
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                }
            }
            Divider()
        }
        .padding()

    }
}

#Preview {
    ThreadCell()
}
