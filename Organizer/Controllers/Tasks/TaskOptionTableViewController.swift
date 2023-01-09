//
//  TaskOptionTableViewController.swift
//  Organizer
//
//  Created by Pavel Абрамов on 18.09.2022.
//

import UIKit

class TaskOptionTableViewController: UITableViewController {
    
    let idOptionsTaskCell = "idOptionsTaskCell"
    let idOptionsHeader = "idOptionsHeader"
    
    let headerNameArray = ["DATE AND TIME", "LESSON", "TEACHER", "COLOR", "PERIOD"]
    let cellNameArray = ["Date", "Lesson", "Task", ""]
    
    var hexColorCell = "1A4766"
    
    private var taskModel = TasksModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Options Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsTaskCell)
        tableView.register(HeaderOptionTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsHeader)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(saveButtonTapped))
        }
    
    @objc private func saveButtonTapped() {
        
        if taskModel.taskDate == nil || taskModel.taskName == "Unknown" {
            alertOk(title: "Error", message: "Requered fileds: DATE, LESSON")
        } else {
            taskModel.taskColor = hexColorCell
            RealmManager.shared.saveTaskModel(model: taskModel)
            taskModel = TasksModel()
            alertOk(title: "Success", message: nil)
            hexColorCell = "1A4766"
            tableView.reloadData()
        }
    }
    
    private func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    //MARK: UItableViewDelegate, UITableViewDataSourse
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsTaskCell, for: indexPath) as! OptionsTableViewCell
        cell.cellTasksConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColorCell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsHeader) as!
        HeaderOptionTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath.section {
        case 0: alertDate(label: cell.nameCellLabel) {(numberWeekday , date) in
            self.taskModel.taskDate = date
        }
            
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Name", placeholder: "Enter name lesson") { text in
            self.taskModel.taskName = text
        }
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Type", placeholder: "Enter type lesson") { text in
            self.taskModel.taskDesctiption = text
        }
        case 3: pushControllers(vc: TaskColorTableViewController())
        default:
            print("Tap OptionsTableView")
        }
    }
}

