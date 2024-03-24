//
//  CircularProfileImageView.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 24/03/2024.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("cat-mimi2")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
