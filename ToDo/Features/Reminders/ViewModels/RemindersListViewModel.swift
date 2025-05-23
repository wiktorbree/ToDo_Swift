//
//  RemindersListViewModel.swift
//  ToDo
//
//  Created by Wiktor Bramer on 03/05/2025.
//

import Foundation
import Combine

class RemindersListViewModel: ObservableObject {
    
    @Published var reminders = [Reminder]()
    
    @Published var errorMessage: String?
    
    private var remindersRepository: RemindersRepository = RemindersRepository()
    
    init() {
        remindersRepository
            .$reminders
            .assign(to: &$reminders)
    }
    
    func addReminder(_ reminder: Reminder) {
        do {
            try remindersRepository.addReminder(reminder)
            errorMessage = nil
        }
        catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    func toggleCompleted(_ reminder: Reminder) {
        if let index = reminders.firstIndex(where: { $0.id == reminder.id}) {
            reminders[index].isCompleted.toggle()
        }
    }
}
