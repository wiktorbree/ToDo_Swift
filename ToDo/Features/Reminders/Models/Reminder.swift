//
//  Reminder.swift
//  ToDo
//
//  Created by Wiktor Bramer on 03/05/2025.
//

import Foundation

struct Reminder: Identifiable {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
}

extension Reminder {
    static let samples = [
        Reminder(title: "Build sample app", isCompleted: true),
        Reminder(title: "Add unit tests"),
        Reminder(title: "Make it pretty"),
        Reminder(title: "Profit!"),
    ]
}
