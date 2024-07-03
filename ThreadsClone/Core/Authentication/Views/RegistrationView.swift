//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 23/03/2024.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()

    @Environment (\.dismiss) var dismiss

    let iconWidth = 120.0
    let iconHeight = 120.0
    
    let signUpButtonWidth = 350.0
    let signUpButtonHeight = 44.0
    
    var body: some View {
        VStack {
            Spacer()
            Image("threads-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: iconWidth, height: iconHeight)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $viewModel.withEmail)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your full name", text: $viewModel.fullname)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your username", text: $viewModel.username)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                
                }
            Button {
                Task {
                    try await viewModel.createUser()
                }
            } label: {
                Text("Sign up")
                    .fontWeight(.semibold)
                    .frame(width: signUpButtonWidth,height: signUpButtonHeight)
                    .background(Color(.black))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3){
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundColor(.black)
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    RegistrationView()
}
