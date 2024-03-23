//
//  ThreadsTabView.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 23/03/2024.
//

import SwiftUI

struct ThreadsTabView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Feed View")
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house").environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear {
                    selectedTab = 0
                }
                .tag(0)
            
            Text("Explore").tabItem {
                Image(systemName: "magnifyingglass")
            }
            .onAppear {
                selectedTab = 1
            }
            .tag(1)
            
            Text("Upload Thread").tabItem {
                Image(systemName: "plus")
            }.onAppear {
                selectedTab = 2
            }
            .tag(2)
            
            Text("Activity").tabItem {
                Image(systemName: selectedTab == 3 ? "heart.fill" : "heart").environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
            }.onAppear {
                selectedTab = 3
            }
            .tag(3)
            
            Text("Explore").tabItem {
                Image(systemName: selectedTab == 4 ? "person.fill" : "person").environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
            }.onAppear {
                selectedTab = 4
            }
            .tag(4)
        }
        .tint(.black)
        
    }
}

#Preview {
    ThreadsTabView()
}
