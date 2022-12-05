//
//  RealmManager.swift
//  Organizer
//
//  Created by TestTest on 13.10.2022.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    private init() {}
    
    let localRealm = try! Realm()
    
    func saveScheduleModel(model: ScheduleModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
}
