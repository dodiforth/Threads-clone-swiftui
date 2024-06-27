//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 25/06/2024.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var selcectedItem: PhotosPickerItem? {
        didSet {
            Task { await loadImage() }
        }
    }
    @Published var profileImage:Image?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.user = user
        }.store(in: &cancellables)
    }
    
    private func loadImage() async {
        guard let selectedItem = selcectedItem else { return }
        
        do {
            if let data = try await selectedItem.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.profileImage = Image(uiImage: uiImage)
                    }
                }
            }
        } catch {
            print("Error loading image: \(error.localizedDescription)")
        }
    }
}
