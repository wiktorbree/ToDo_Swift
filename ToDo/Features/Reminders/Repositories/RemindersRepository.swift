//
//  RemindersRepository.swift
//  ToDo
//
//  Created by Wiktor Bramer on 07/05/2025.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

public class RemindersRepository: ObservableObject {
    
    @Published
    var reminders = [Reminder]()
    
    func addReminder(_ reminder: Reminder) throws {
        Firestore
            .firestore()
            .collection("reminders")
            .addDocument(from: reminder)
    }
    
}
