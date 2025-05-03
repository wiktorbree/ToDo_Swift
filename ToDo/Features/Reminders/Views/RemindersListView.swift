//
//  ContentView.swift
//  ToDo
//
//  Created by Wiktor Bramer on 03/05/2025.
//

import SwiftUI

struct RemindersListView: View {
    
    @StateObject private var viewModel = RemindersListViewModel()
    
    @State private var isAddReminderDialogPresented: Bool = false
    
    private func presentAddReminderView() {
        isAddReminderDialogPresented.toggle()
    }
    
    
    var body: some View {
        
        List($viewModel.reminders) { $reminder in
            RemindersListRowView(reminder: $reminder)
        }
        .toolbar() {
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: presentAddReminderView) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                    }
                }
                .padding()
                Spacer()
            }
        }
        .sheet(isPresented: $isAddReminderDialogPresented) {
            AddReminderView { reminder in
                viewModel.addReminder(reminder)
            }
        }
        .tint(.orange)
    }
}

#Preview {
    NavigationStack {
          RemindersListView()
            .navigationTitle("Reminders")
        }
}
