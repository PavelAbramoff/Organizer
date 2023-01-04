//
//  AlertForCellName.swift
//  Organizer
//
//  Created by Pavel Абрамов on 17.09.2022.
//

import UIKit

extension UIViewController {
    
    func alertForCellName(label: UILabel, name: String, placeholder: String, completionHandler: @escaping (String) -> Void) {
        
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let textFildAlert = alert.textFields?.first
            guard let text = textFildAlert?.text else { return }
            label.text = (text != "" ? text : label.text)
            completionHandler(text)
        }
        
        alert.addTextField { (textFildAlert) in
            textFildAlert.placeholder = placeholder
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}
