//
//  StorageManager.swift
//  Futboly
//
//  Created by Andrei Tanc on 11.11.2023.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseAuth
import ProgressHUD

class StorageManager {
    static var shared: StorageManager = StorageManager()
    
    private let storage = Storage.storage()
    private var userId: String {
        Auth.auth().currentUser?.uid ?? ""
    }
    
    private init() {}
    
    func saveProfileImage(_ image: UIImage, completion: @escaping () -> Void) {
        let profileImageRef = storage.reference().child("profileImages/\(userId)")
        
        if let uploadData = image.jpegData(compressionQuality: 0.5) {
            profileImageRef.putData(uploadData, metadata: nil) { [weak self] (metadata, error) in
                if let error {
//                    present error
                }
                
                self?.saveProfileImageURL()
                completion()
            }
        }
    }
    
    private func saveProfileImageURL() {
        let profileImageRef = storage.reference().child("profileImages/\(userId)")
        
        profileImageRef.downloadURL { url, error in
            guard let url else { ProgressHUD.dismiss(); return }
            FirestoreManager.shared.updateUser(withParams: ["profileImageURL": url.absoluteString])
        }
    }
    
    func getProfileImageIfNeeded(forUser user: User) {
        guard let url = URL(string: user.profileImageURL) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                FutbolyVault.shared.userProfileImage = image
            }
        }
        task.resume()
    }
}
