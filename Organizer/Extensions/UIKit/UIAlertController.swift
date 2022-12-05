//
//  UIAlertController.swift
//  Organizer
//
//  Created by Pavel Абрамов on 17.09.2022.
//

import UIKit

extension UIAlertController {
    
    func negativeWidthConstraint() {
        
        for subView in self.view.subviews {
            for constraints in subView.constraints where constraints.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraints)
            }
        }
    }
}
