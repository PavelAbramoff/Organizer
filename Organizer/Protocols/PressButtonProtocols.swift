//
//  PressButtonProtocols.swift
//  Organizer
//
//  Created by Pavel Абрамов on 16.09.2022.
//

import UIKit

protocol PressReadyTaskButtonProtocol: AnyObject {
    func readyButtonTapped(indexPath: IndexPath)
}

protocol SwitchRepeatProtocol: AnyObject {
    func switchRepeat(value: Bool)
}
