//
//  ContactsTableViewController.swift
//  Organizer
//
//  Created by TestTest on 21.09.2022.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    let searchController = UISearchController()
    
    let idContactkCell = "idContactkCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .singleLine
        tableView.register(ContaktsTableViewCell.self, forCellReuseIdentifier: idContactkCell)
        
        title = "Contacts"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    @objc func addButtonTapped() {
        let contactOption = ContactOptionTableViewController()
        navigationController?.pushViewController(contactOption, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idContactkCell, for: indexPath) as! ContaktsTableViewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap Cell")
    }
}
