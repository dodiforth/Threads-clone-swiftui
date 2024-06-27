//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 25/03/2024.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack {
                    //name and profile image
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            Text("Mimi Leclerc")
                        }
                        
                        Spacer()
                        
                        CircularProfileImageView()
                    }
                    
                    Divider()
                    
                    //bio field
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter you bio...",text: $bio, axis: .vertical)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add link...",text: $link)
                    }
                    
                    Divider()
                    
                    Toggle("Private profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
