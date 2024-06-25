//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 25/06/2024.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var user: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.user = user
        }.store(in: &cancellables)
    }
}
