//
//  TeachersViewController.swift
//  Organizer
//
//  Created by Pavel Абрамов on 17.09.2022.
//

import UIKit
import RealmSwift

class TeachersTableViewController: UITableViewController {
    
    private let localRealm = try! Realm()
    private var contactArray: Results<ContactModel>!
    private let teacherId = "teacherId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Teachers"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: teacherId)
        
        contactArray = localRealm.objects(ContactModel.self).filter("contactsType = 'Teacher'")
    }
    
    private func setTeacher(teacher: String) {
        let scheduleOptions = self.navigationController?.viewControllers[1] as? ScheduleOptionsTableViewController
        scheduleOptions?.scheduleModel.scheduleTeacher = teacher
        scheduleOptions?.cellNameArray[2][0] = teacher
        scheduleOptions?.tableView.reloadRows(at: [[2,0]], with: .none)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: teacherId, for: indexPath) as! ContactsTableViewCell
        let model = contactArray[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = contactArray[indexPath.row]
        setTeacher(teacher: model.contactsName)
    }
}
