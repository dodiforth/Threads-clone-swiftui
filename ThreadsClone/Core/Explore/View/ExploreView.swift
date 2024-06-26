//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 23/03/2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                    .padding(.horizontal)
                                Divider()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self) { user in
                    ProfileView(user: user)
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
