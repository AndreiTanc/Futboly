//
//  ProfileEditViewModel.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import Foundation
import SwiftUI
import PhotosUI
import ProgressHUD

class ProfileEditViewModel: ObservableObject {
    @ObservedObject private(set) var vault: FutbolyVault = FutbolyVault.shared
    
    @Published var teamName: String = FutbolyVault.shared.user.teamName
    @Published var phoneNumber: String = ""
    
    @Published var selectedImage: UIImage? = FutbolyVault.shared.userProfileImage
    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet {
            setImage(from: imageSelection)
        }
    }
    
    private func setImage(from selection: PhotosPickerItem?) {
        guard let selection else { return }
        
        Task {
            if let data = try? await selection.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.selectedImage = uiImage
                    }
                    return
                }
            }
        }
    }
    
    func save() {
        guard let selectedImage else { return }
        ProgressHUD.animate()
        StorageManager.shared.saveProfileImage(selectedImage) {
            ProgressHUD.dismiss()
        }
    }
}
