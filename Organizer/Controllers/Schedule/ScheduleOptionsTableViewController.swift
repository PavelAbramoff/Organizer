//
//  ScheduleOptionsTableViewController.swift
//  Organizer
//
//  Created by Pavel Абрамов on 16.09.2022.
//

import UIKit
import RealmSwift

class ScheduleOptionsTableViewController: UITableViewController {
    
    private let idOptionsSchedolCell = "idOptionsSchedolCell"
    private let idOptionsHeader = "idOptionsHeader"
    
    var cellNameArray = [["Date","Time"],
                         ["Name", "Type", "Bild", "Audience"],
                         ["Teacher Name"],
                         [""],
                         ["Repeat every 7 days"]]
    
    let headerNameArray = ["DATE AND TIME", "LESSON", "TEACHER", "COLOR", "PERIOD"]
    
    var scheduleModel = ScheduleModel()
    
    var hexColorCell = "8BD6F9"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsSchedolCell)
        tableView.register(HeaderOptionTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsHeader)
        
        title = "Options Schedule"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
    }
    
    @objc  private func saveButtonTapped() {
        
        if scheduleModel.scheduleDate == nil || scheduleModel.scheduleTime == nil || scheduleModel.scheduleName == "Unknown" {
            alertOk(title: "Error", message: "Requered fileds: DATE, TIME, NAME")
        } else {
            scheduleModel.scheduleColor = hexColorCell
            RealmManager.shared.saveScheduleModel(model: scheduleModel)
            scheduleModel = ScheduleModel()
            alertOk(title: "Success", message: nil)
            hexColorCell = "79D6F9"
            cellNameArray[2][0] = "Teacher Name"
            tableView.reloadData()
            print(hexColorCell)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 4
        case 2: return 1
        case 3: return 1
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSchedolCell, for: indexPath) as! OptionsTableViewCell
        cell.cellScheduleConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColorCell)
    
        cell.switchRepeatDelegate = self
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
        
        switch indexPath {
        case [0,0]:
            alertDate(label: cell.nameCellLabel) { (numberWeekday , date) in
                self.scheduleModel.scheduleDate = date
                self.scheduleModel.scheduleWeekday = numberWeekday
            
        }
        case [0,1]:
            alertTime(label: cell.nameCellLabel) { (time) in
                self.scheduleModel.scheduleTime = time
        }
            
        case [1,0]:
            alertForCellName(label: cell.nameCellLabel,
                             name: "Name",
                             placeholder: "Enter name lesson") { text in
                self.scheduleModel.scheduleName = text
        }
        case [1,1]:
            alertForCellName(label: cell.nameCellLabel,
                             name: "Type",
                             placeholder: "Enter type lesson") { text in
                self.scheduleModel.scheduleType = text
        }
        case [1,2]:
            alertForCellName(label: cell.nameCellLabel,
                             name: "Bild",
                             placeholder: "Enter number of building") { text in
                self.scheduleModel.scheduleBuilding = text
        }
        case [1,3]:
            alertForCellName(label: cell.nameCellLabel,
                             name: "Audience",
                             placeholder: "Enter number of audience") { text in
                self.scheduleModel.scheduleAudience = text
        }
            
        case [2,0]:
            pushControllers(vc: TeachersTableViewController())
        case [3,0]:
            pushControllers(vc: ScheduleColorsViewController())
        default:
            print("Tap OptionsTableView")
        }
    }
    
    func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ScheduleOptionsTableViewController: SwitchRepeatProtocol {
    func switchRepeat(value: Bool) {
        scheduleModel.scheduleRepaet = value
    }
}
