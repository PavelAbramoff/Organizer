//
//  ContactModel.swift
//  Organizer
//
//  Created by TestTest on 09.01.2023.
//

import RealmSwift
import Foundation

class ContactModel: Object {
    
    @Persisted var contactsName = "Unknown"
    @Persisted var contactsPhone = "Unknown"
    @Persisted var contactsMail = "Unknown"
    @Persisted var contactsType = "Unknown"
    @Persisted var contactsImage: Data?
}
