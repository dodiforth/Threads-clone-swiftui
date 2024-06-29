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
    
    
    private func loadImage() async {
        
        guard let selectedItem = selectedItem else { return }
        
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
