//
//  OptionsTableViewCell.swift
//  Organizer
//
//  Created by Pavel Абрамов on 16.09.2022.
//

import UIKit

class OptionsTableViewCell: UITableViewCell {
    
    let backgroundViewCell: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameCellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let reapeatSwitch: UISwitch = {
        let reapeatSwitch = UISwitch()
        reapeatSwitch.isOn = true
        reapeatSwitch.isHidden = true
        reapeatSwitch.onTintColor = .blue
        reapeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return reapeatSwitch
    }()
    
    weak var switchRepeatDelegate: SwitchRepeatProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        reapeatSwitch.addTarget(self, action: #selector(switchCange(paramTarget:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellScheduleConfigure(nameArray: [[String]], indexPath: IndexPath) {
        nameCellLabel.text = nameArray[indexPath.section][indexPath.row]
        
        if indexPath == [3,0] {
            backgroundViewCell.backgroundColor = .blue
        }
        
        if indexPath == [4,0] {
            reapeatSwitch.isHidden = false
        }
    }
    
    func cellTasksConfigure(nameArray: [String], indexPath: IndexPath) {
        nameCellLabel.text = nameArray[indexPath.section]
        
        if indexPath == [3,0] {
            backgroundViewCell.backgroundColor = .blue
        }
    }
    
    func cellContactConfigure(nameArray: [String], indexPath: IndexPath) {
        nameCellLabel.text = nameArray[indexPath.section]
        
        indexPath.section == 4 ? backgroundViewCell.image = UIImage(systemName: "person.fill.badge.plus") : nil
        
    }
    
    @objc func switchCange(paramTarget: UISwitch) {
        switchRepeatDelegate?.switchRepeat(value: paramTarget.isOn)
    }
    
    func setConstraints() {
        
        self.addSubview(backgroundViewCell)
        NSLayoutConstraint.activate([
            backgroundViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgroundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backgroundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            backgroundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1)
        ])
        
        self.addSubview(nameCellLabel)
        NSLayoutConstraint.activate([
            nameCellLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameCellLabel.leadingAnchor.constraint(equalTo: backgroundViewCell.leadingAnchor, constant: 15),
        ])
        
        self.contentView.addSubview(reapeatSwitch)
        NSLayoutConstraint.activate([
            reapeatSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            reapeatSwitch.trailingAnchor.constraint(equalTo: backgroundViewCell.trailingAnchor, constant: -20),
        ])
    }
}

