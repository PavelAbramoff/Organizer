//
//  MainTabBarController.swift
//  Organizer
//
//  Created by Pavel Абрамов on 10.09.2022.
//

import UIKit
import RealmSwift

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    func setupTabBar() {
        let sheduleViewController = createNavController(
            vc: SheduleViewController(),
            itemName: "Shedule",
            ItemName: "calendar.badge.clock"
        )
        
        let tasksViewController = createNavController(
            vc: TasksViewController(),
            itemName: "Tasks",
            ItemName: "text.badge.checkmark"
        )
        
        let contactsViewController = createNavController(
            vc: ContactsTableViewController(),
            itemName: "Contacts",
            ItemName: "rectangle.stack.person.crop"
        )
        viewControllers = [sheduleViewController, tasksViewController, contactsViewController]
    }
    
    // Cоздаем навигатион контроллер
    func createNavController(vc: UIViewController, itemName: String, ItemName: String) -> UINavigationController {
        
        let item = UITabBarItem(
            title: itemName,image: UIImage(systemName: ItemName)?.withAlignmentRectInsets(.init(
                top: 10,
                left: 0,
                bottom: 0,
                right: 0)),
            tag: 0
        )
        
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        navController.navigationBar.scrollEdgeAppearance = navController.navigationBar.standardAppearance
        
        return navController
    }
}

