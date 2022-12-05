//
//  HeaderOptionScheduleTableViewCell.swift
//  Organizer
//
//  Created by Pavel Абрамов on 16.09.2022.
//

import UIKit

class HeaderOptionTableViewCell: UITableViewHeaderFooterView {
    
    let headerLabel = UILabel(text: "", font: .avenirNext14())
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        headerLabel.textColor = .gray
        
        self.contentView.backgroundColor = .systemGray6
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func headerConfigure(nameArray: [String], section: Int) {
        headerLabel.text = nameArray[section]
    }
    
    func setConstraints() {
        
        self.addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
