//
//  AlertFriendOrTeacher.swift
//  Organizer
//
//  Created by TestTest on 22.09.2022.
//

import UIKit

extension UIViewController {
    
    func alertFriendOrTeacher(label: UILabel, completionHandle: @escaping (String) -> Void) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let friend = UIAlertAction(title: "Friend", style: .default) { _ in
            label.text = "Friend"
            let typeContact = "Friend"
            completionHandle(typeContact)
        }
        
        let teacher = UIAlertAction(title: "Teacher", style: .default) { _ in
            label.text = "Teacher"
            let typeContact = "Teacher"
            completionHandle(typeContact)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(friend)
        alertController.addAction(teacher)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
}
