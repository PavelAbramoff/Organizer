//
//  ContactOptionTableViewController.swift
//  Organizer
//
//  Created by TestTest on 22.09.2022.
//

import UIKit

class ContactOptionTableViewController: UITableViewController {
    
    private let idOptionsContactCell = "idOptionsContactCell"
    private let idContactHeader = "idContactHeader"
    
    private let headerNameArray = ["NAME", "PHONE", "MAIL", "TYPE", "CHOOSE IMAGE"]
    private let cellNameArray = ["Name", "Phone", "Mail", "Type", ""]
    
    private var imageIsChanged = false
    var contactModel = ContactModel()
    var editModel = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Option Contacs"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsContactCell)
        tableView.register(HeaderOptionTableViewCell.self, forHeaderFooterViewReuseIdentifier: idContactHeader)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(saveButtonTapped))
    }
    
    @objc private func saveButtonTapped() {
        
        if contactModel.contactsName == "Unknown" || contactModel.contactsType == "Unknown" {
            alertOk(title: "Error", message: "Requered fileds: NAME and TYPE")
        } else {
            setImageModel()
            
            RealmManager.shared.saveContactModel(model: contactModel)
            contactModel = ContactModel()
            alertOk(title: "Success", message: nil)
            tableView.reloadData()
        }
    }
    
    private func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func setImageModel() {
        if imageIsChanged {
            let cell = tableView.cellForRow(at: [4,0]) as! OptionsTableViewCell
            
            let image = cell.backgroundViewCell.image
            guard let imageData = image?.pngData() else { return }
            contactModel.contactsImage = imageData
            
            cell.backgroundViewCell.contentMode = .scaleAspectFit
            imageIsChanged = false
        } else {
            contactModel.contactsImage = nil
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsContactCell, for: indexPath) as! OptionsTableViewCell
        
        
        cell.cellContactConfigure(nameArray: cellNameArray, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 4 ? 200 : 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idContactHeader) as!
        HeaderOptionTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath.section {
        case 0: alertForCellName(label: cell.nameCellLabel, name: "NameContact", placeholder: "Enter name") { text in
            self.contactModel.contactsName = text
        }
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Phone Contact", placeholder: "Enter phone") { text in
            self.contactModel.contactsPhone = text
        }
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Mail Contact", placeholder: "Enter mail") { text in
            self.contactModel.contactsMail = text
        }
        case 3: alertFriendOrTeacher(label: cell.nameCellLabel) { (type) in
            self.contactModel.contactsType = type
        }
        case 4: alertPhotoCamera { [self] source in
            chooseImagePicker(source: source)
        }
        default:
            print("Tab")
        }
    }
    
//    func pushControllers(vc: UIViewController) {
//        let viewController = vc
//        navigationController?.navigationBar.topItem?.title = "Options"
//        navigationController?.pushViewController(viewController, animated: true)
//    }
}

extension ContactOptionTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let cell = tableView.cellForRow(at: [4,0]) as! OptionsTableViewCell
        
        cell.backgroundViewCell.image = info[.editedImage] as? UIImage
        cell.backgroundViewCell.contentMode = .scaleAspectFill
        cell.backgroundViewCell.clipsToBounds = true
        imageIsChanged = true
        dismiss(animated: true)
    }
}

