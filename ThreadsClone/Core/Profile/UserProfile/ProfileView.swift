//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 23/03/2024.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
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
                            .frame(width: 352, height: 32)
                            .background(.black)
                            .cornerRadius(8)
                    }
                    
                    // user content list view
                    UserContentListView()
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
