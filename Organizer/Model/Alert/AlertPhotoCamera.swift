//
//  PhotoCamera.swift
//  Organizer
//
//  Created by TestTest on 22.09.2022.
//

import UIKit

extension UIViewController {
    
    func alertPhotoCamera(completionHandler: @escaping (UIImagePickerController.SourceType) -> Void) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            let camera = UIImagePickerController.SourceType.camera
            completionHandler(camera)
        }
        
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default) { _ in
            let photoLibrary = UIImagePickerController.SourceType.photoLibrary
            completionHandler(photoLibrary)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.negativeWidthConstraint()
        
        alertController.addAction(camera)
        alertController.addAction(photoLibrary)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
}
