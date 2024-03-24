//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 23/03/2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { user in
                        VStack {
                            UserCell()
                                .padding(.horizontal)
                            Divider()
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
        
    }
}

// struct SearchBar: View {
//     @Binding var text: String

//     var body: some View {
//         HStack {
//             HStack {
//                 Image(systemName: "magnifyingglass")
//                     .foregroundColor(.gray)
//                 TextField("Search", text: $text)
//             }
//                 .padding(8)
//                 .background(Color(.systemGray6))
//                 .cornerRadius(8)
//                 .padding(.horizontal, 16)
//         }
//     }
// }

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
