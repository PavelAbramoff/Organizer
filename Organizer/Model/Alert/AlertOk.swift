//
//  AlertOk.swift
//  Organizer
//
//  Created by TestTest on 29.11.2022.
//

import UIKit

extension UIViewController {
    
    func alertOk(title: String, message: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
}

