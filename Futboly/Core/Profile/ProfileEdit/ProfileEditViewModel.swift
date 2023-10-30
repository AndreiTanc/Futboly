//
//  ProfileEditViewModel.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import Foundation
import SwiftUI
import PhotosUI

class ProfileEditViewModel: ObservableObject {
    @Published var teamName: String = ""
    @Published var phoneNumber: String = ""
    
    @Published var selectedImage: UIImage? = nil
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
                    selectedImage = uiImage
                    return
                }
            }
        }
    }
    
    func save() {
        
    }
}
