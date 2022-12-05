//
//  ScheduleModel.swift
//  Organizer
//
//  Created by TestTest on 13.10.2022.
//

import RealmSwift
import Foundation

class ScheduleModel: Object {
    
    @Persisted var scheduleDate = Date()
    @Persisted var scheduleTime = Date()
    @Persisted var scheduleName: String = ""
    @Persisted var scheduleType: String = ""
    @Persisted var scheduleBuilding: String = ""
    @Persisted var scheduleAudience: String = ""
    @Persisted var scheduleTeacher: String = "Name LastName"
    @Persisted var scheduleColor: String = "FFFFFF"
    @Persisted var scheduleRepaet: Bool = true
    @Persisted var scheduleWeekday: Int = 1
}
