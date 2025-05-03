//
//  RemindersListRowView.swift
//  ToDo
//
//  Created by Wiktor Bramer on 03/05/2025.
//

import SwiftUI

struct RemindersListRowView: View {
    
    @Binding var reminder: Reminder
    
    var body: some View {
        HStack {
            Toggle(isOn: $reminder.isCompleted) {}
                .toggleStyle(.reminder)
            Text(reminder.title)
        }
    }
}

struct RemindersListRowView_Previews: PreviewProvider {
  struct Container: View {
    @State var reminder = Reminder.samples[0]
    var body: some View {
        List{
            RemindersListRowView(reminder: $reminder)
        }
        .listStyle(.plain)
    }
  }


  static var previews: some View {
      NavigationView() {
          Container()
              .navigationTitle("Reminders")
      }
  }
}
