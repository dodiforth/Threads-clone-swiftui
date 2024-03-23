//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 23/03/2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullname: String = ""
    @State private var username: String = ""
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
                TextField("Enter your email", text: $email)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                SecureField("Enter your password", text: $password)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your full name", text: $fullname)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your username", text: $username)
                    .modifier(ThreadsTextFieldModifier())
                
                }
            Button {
                print("Signup button tapped")
            } label: {
                Text("Sign up")
                    .fontWeight(.semibold)
                    .frame(width: signUpButtonWidth,height: signUpButtonHeight)
                    .background(Color(.systemGray))
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
