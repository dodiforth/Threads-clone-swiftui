//
//  RegistrationViewModel.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 01/04/2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullname: String = ""
    @Published var username: String = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(
            email: email,
            password: password,
            fullname: fullname,
            username: username)
    }
}
