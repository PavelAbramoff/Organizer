//
//  TasksModel.swift
//  Organizer
//
//  Created by TestTest on 05.01.2023.
//

import RealmSwift
import Foundation

class TasksModel: Object {
    
    @Persisted var taskDate: Date?
    @Persisted var taskName: String = "Unknown"
    @Persisted var taskDesctiption: String = "Unknown"
    @Persisted var taskColor: String = "1A4766"
    @Persisted var taskReady: Bool = false
}
