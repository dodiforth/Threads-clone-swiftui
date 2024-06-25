//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 01/04/2024.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: Create User \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: withEmail, password: password)
            self.userSession = result.user
            
            try await uploadUserData(withEmail: withEmail, fullname: fullname, username: username, id: result.user.uid)
            print("DEBUG: Create User \(result.user.uid)")

            
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() // sign out on backend
        self.userSession = nil // this removes session locally and updates routing
    }
    
    @MainActor
    private func uploadUserData(
        withEmail email: String,
        fullname: String,
        username: String,
        id: String) async throws {
            let user = User(id: id, fullname: fullname, email: email, username: username)
            //Encode the user
            guard let userData = try? Firestore.Encoder().encode(user) else { return }
            try await Firestore.firestore().collection("users").document(id).setData(userData)
            
        }
}
