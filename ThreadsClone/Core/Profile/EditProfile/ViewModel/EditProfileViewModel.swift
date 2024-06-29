//
//  EditProfileViewModel.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 28/06/2024.
//

import SwiftUI
import PhotosUI

class EditProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task { await loadImage() }
        }
    }
    @Published var profileImage:Image?
    private var uiImage: UIImage?
    
    func updateUserData() async throws {
        try await updateProfileImage()
    }
    
    
    private func loadImage() async {
        
        guard let selectedItem = selectedItem else { return }
        
        do {
            if let data = try await selectedItem.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.uiImage = uiImage
                        self.profileImage = Image(uiImage: uiImage)
                    }
                }
            }
        } catch {
            print("Error loading image: \(error.localizedDescription)")
        }
    }
    
    private func updateProfileImage() async throws {
        guard let image = self.uiImage else { return }
        guard let imageUrl = try await ImageUploader.uploadImage(image) else { return }
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
    }
}
