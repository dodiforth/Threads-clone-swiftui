//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 01/04/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
