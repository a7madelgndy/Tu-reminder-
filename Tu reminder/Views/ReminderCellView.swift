//
//  ReminderCellView.swift
//  Tu reminder
//
//  Created by Ahmed El Gndy on 01/01/2025.
//

import SwiftUI

struct ReminderCellView: View {
    //MARK: properties
    let reminder: Reminder
    @State var isDone:Bool = false
    //MARK: functions
    private func formateDate(date : Date)-> String {
        if date.isToday {
            return "Today"
        }else if date.isTomorrow {
            return "Tomorroe"
        }else {
            return date.formatted(date:.numeric , time: .omitted)
        }
    }
    //MARK: Body
    var body: some View {
        HStack {
            Image(systemName:isDone ? "circle.inset.filled" : "circle")
                .font(.title)
                .opacity(0.4)
                .foregroundColor(.gray)
                .onTapGesture {
                    isDone.toggle()
                }
            VStack {
                Text(reminder.title ?? "no string")
                    .font(.title3)
                if let notes = reminder.note {
                    Text(notes)
                        .font(.caption)
                        .opacity(0.6)
                }
            HStack {
                if let reminderDate = reminder.reminderData {
                    Text(formateDate(date:reminderDate))
                }
                    if let reminderTime = reminder.reminderData {
                        Text(reminderTime.formatted(date:.omitted , time: .shortened))
                    }
                }//:HStack
            }//:VStack
            
        }//:HStack
        .frame(maxWidth: .infinity , alignment: .leading)

        
    }
}

#Preview {
    ReminderCellView(reminder: PreviewData.reminder)
}
