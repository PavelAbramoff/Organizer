//
//  ContaktsTableViewCell.swift
//  Organizer
//
//  Created by TestTest on 21.09.2022.
//

import UIKit

class ContaktsTableViewCell: UITableViewCell {
    
    let contavtImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sky")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let phoneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "phone.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let mailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "envelope.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel = UILabel(text: "Cruella De Vill", font: .avenirNext20())
    let phoneLabel = UILabel(text: "+7 987 85 85 84", font: .avenirNext14())
    let mailLabel = UILabel(text: "jkj@mail.ru", font: .avenirNext14())
    
    let idContactkCell = "idContactkCell"
    
    override func layoutIfNeeded() {
        super.layoutSubviews()
        
        contavtImageView.layer.cornerRadius = contavtImageView.frame.height / 2
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        self.addSubview(contavtImageView)
        NSLayoutConstraint.activate([
            contavtImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            contavtImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            contavtImageView.widthAnchor.constraint(equalToConstant: 70),
            contavtImageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        self.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: contavtImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 21)
        ])
        
        let stackView = UIStackView(arrangedSubviews: [phoneImageView, phoneLabel, mailImageView, mailLabel], axis: .horizontal, spacing: 3, distribution: .fillProportionally)
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contavtImageView.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
}

