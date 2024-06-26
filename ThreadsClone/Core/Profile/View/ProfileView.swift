//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 23/03/2024.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {

                    ProfileHeaderView(user: user)
                    
                    Button{
                        
                    } label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 362, height: 32)
                            .background(.black)
                            .cornerRadius(8)
                    }
                    
                    // user content list view
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases){ filter in
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : . regular)
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .frame(width: filterBarWidth, height: 1)
                                            .foregroundColor(.black)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    } else {
                                        Rectangle()
                                            .frame(width: filterBarWidth, height: 1)
                                            .foregroundColor(.clear)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring()){
                                        selectedFilter = filter
                                    }
                                }
                            }
                        }
                        LazyVStack {
                            ForEach(0 ... 10, id:\.self){ thread in
                                ThreadCell()
                            }
                        }
                    }
                    .padding(.vertical, 8)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal)
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
