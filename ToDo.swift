//
//  ToDo.swift
//  ToDoList
//
//  Created by Zimeng Yang on 3/8/26.
//

import Foundation
import SwiftData

@Model

class ToDo {
    var item: String = ""
    var reminderIsOn = false
    var dueDate = Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!
    var notes = ""
    var isCompleted = false
    
    init(item: String = "", reminderIsOn: Bool = false, dueDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!, notes: String = "", isCompleted: Bool = false) {
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.dueDate = dueDate
        self.notes = notes
        self.isCompleted = isCompleted
    }
}

