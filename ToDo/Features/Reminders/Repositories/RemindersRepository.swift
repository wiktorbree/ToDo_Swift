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
    
    private var listenerRegistration: ListenerRegistration?
    
    init() {
        subscribe()
    }
    
    deinit {
        unscubscribe()
    }
    
    func subscribe() {
        if  listenerRegistration == nil {
            let query = Firestore.firestore().collection(Reminder.collectionName)
            
            listenerRegistration = query
                .addSnapshotListener {[weak self] (querySnapshot, error) in
                    guard let documents = querySnapshot?.documents else {
                        print("No documents")
                        return
                    }
                    
                    print("Mapping \(documents.count) documents")
                    self?.reminders = documents.compactMap { queryDocumentSnapshot in
                        do {
                            return try queryDocumentSnapshot.data(as: Reminder.self)
                        }
                        catch {
                            print("Error while trying to map document \(queryDocumentSnapshot.documentID): \(error.localizedDescription)")
                            return nil
                        }
                    }
                }
        }
    }
    
    private func unscubscribe() {
        if listenerRegistration != nil {
            listenerRegistration?.remove()
            listenerRegistration = nil
        }
    }
    
    func addReminder(_ reminder: Reminder) throws {
        Firestore
            .firestore()
            .collection("reminders")
            .addDocument(from: reminder)
    }
    
}
