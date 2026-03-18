//
//  ToDo.swift
//  ToDoList
//
//  Created by Zimeng Yang on 3/8/26.
//

import Foundation
import SwiftData

@MainActor
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

extension ToDo {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        container.mainContext.insert(ToDo(item: "Create SwiftData Lessons", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "Now with iOS 16", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Watch iOS videos", reminderIsOn: true, dueDate: Date.now + 60*60*12, notes: "I'm in a hurry", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Finish this app", reminderIsOn: true, dueDate: Date.now + 60*60*72, notes: "Stay Swifty", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Algo class and practice questions", reminderIsOn: true, dueDate: Date.now + 60*60*44, notes: "Hard but ddl approaching", isCompleted: false))
        
        return container
    }
}
