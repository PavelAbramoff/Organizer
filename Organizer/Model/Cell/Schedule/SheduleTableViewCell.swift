//
//  SheduleTableViewCell.swift
//  Organizer
//
//  Created by Pavel Абрамов on 14.09.2022.
//

import UIKit

class SheduleTableViewCell: UITableViewCell {
    
    let lessonName = UILabel(text: "", font: .avenirNextDemiBold20())
    let teacherName = UILabel(text: "", font: .avenirNext20(), alignment: .right)
    let lessonTime = UILabel(text: "", font: .avenirNextDemiBold20())
    let typeLabel = UILabel(text: "Type", font: .avenirNext14(), alignment: .right)
    let lessonType = UILabel(text: "", font: .avenirNextDemiBold14())
    let buldingLabel = UILabel(text: "Bilding", font: .avenirNext14(), alignment: .right)
    let lessonBulding = UILabel(text: "", font: .avenirNextDemiBold14())
    let audLabel = UILabel(text: "Audience", font: .avenirNext14(), alignment: .right)
    let lessonAud = UILabel(text: "", font: .avenirNextDemiBold14())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
        
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: ScheduleModel) {
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "HH:mm"
        
        lessonName.text = model.scheduleName
        teacherName.text = model.scheduleTeacher
        lessonTime.text = dateFormater.string(from: model.scheduleTime)
        lessonType.text = model.scheduleType
        lessonBulding.text = model.scheduleBuilding
        lessonAud.text = model.scheduleAudience
        backgroundColor = UIColor().colorFromHex("\(model.scheduleColor)")
    }
    
    func setConstraints() {
        
        let topStackView = UIStackView(arrangedSubviews: [lessonName,teacherName ], axis: .horizontal, spacing: 10, distribution: .fillEqually)
        
        self.addSubview(topStackView)
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        self.addSubview(lessonTime)
        NSLayoutConstraint.activate([
            lessonTime.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            lessonTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            lessonTime.widthAnchor.constraint(equalToConstant: 100),
            lessonTime.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        let bottomStackView = UIStackView(arrangedSubviews: [typeLabel, lessonType, buldingLabel, lessonBulding, audLabel, lessonAud ], axis: .horizontal, spacing: 5, distribution: .fillProportionally)
        
        self.addSubview(bottomStackView)
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            bottomStackView.leadingAnchor.constraint(equalTo: lessonTime.trailingAnchor, constant: 5),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            bottomStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}


//    let lessonName: UILabel = {
//        let label = UILabel()
//        label.text = "Programm"
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next Demi Bold", size: 20)
//        label.textAlignment = .left
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .clear
//        return label
//    }()
 
//    let teacherName: UILabel = {
//        let label = UILabel()
//        label.text = "Patrik"
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next", size: 20)
//        label.textAlignment = .right
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .clear
//        return label
//    }()
    
//    let lessonTime: UILabel = {
//        let label = UILabel()
//        label.text = "08:00"
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next", size: 20)
//        label.textAlignment = .left
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .clear
//        return label
//    }()
    
//    let typeLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Type"
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next", size: 14)
//        label.textAlignment = .right
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .clear
//        return label
//    }()
    
//    let lessonType: UILabel = {
//        let label = UILabel()
//        label.text = "Lection"
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next Deni Bold", size: 14)
//        label.textAlignment = .left
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .clear
//        return label
//    }()
    
//    let buldingLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Bild"
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next", size: 14)
//        label.textAlignment = .right
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .clear
//        return label
//    }()
    
//    let lessonBulding: UILabel = {
//        let label = UILabel()
//        label.text = "1"
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next Deni Bold", size: 14)
//        label.textAlignment = .left
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .clear
//        return label
//    }()
    
//    let audLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Auditorry"
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next", size: 14)
//        label.textAlignment = .right
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .clear
//        return label
//    }()
//
//    let lessonAud: UILabel = {
//        let label = UILabel()
//        label.text = "101"
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next", size: 14)
//        label.textAlignment = .left
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .clear
//        return label
//    }()
