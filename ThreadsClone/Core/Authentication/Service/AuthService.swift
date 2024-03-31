//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 01/04/2024.
//

import Firebase

class AuthService {
    
    static let shared = AuthService()
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        print("DEBUG: Logging in...")
    }
    
    @MainActor
    func createUser(email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: Create User \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
}
