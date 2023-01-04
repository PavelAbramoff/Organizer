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
    @Persisted var scheduleName: String = "Unknown"
    @Persisted var scheduleType: String = "Unknown"
    @Persisted var scheduleBuilding: String = "Unknown"
    @Persisted var scheduleAudience: String = "Unknown"
    @Persisted var scheduleTeacher: String = "Unknown"
    @Persisted var scheduleColor: String = "1A4766"
    @Persisted var scheduleRepaet: Bool = true
    @Persisted var scheduleWeekday: Int = 1
}
