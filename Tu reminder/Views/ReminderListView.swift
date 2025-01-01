//
//  ReminderListView.swift
//  Tu reminder
//
//  Created by Ahmed El Gndy on 01/01/2025.
//

import SwiftUI

struct ReminderListView: View {
    let reminders: FetchedResults<Reminder>
    var body: some View {
        List(reminders) { reminder in
            Text(reminder.title ?? " ")
        }
    }
}

