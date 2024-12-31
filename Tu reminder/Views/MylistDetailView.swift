//
//  MylistDetailView.swift
//  Tu reminder
//
//  Created by Ahmed El Gndy on 31/12/2024.
//

import SwiftUI

struct MylistDetailView: View {
    //MARK: PROPERTIES
    let mylist : MyList
    @State private var openAddReminder: Bool = false
    @State private var title : String = " "
    
    private var isFormValid: Bool {
        !title.isEmpty
    }
    
    //MARK: BODY
    var body: some View {
        //Display list OF Reminders
        VStack {
            HStack {
                Image(systemName: "plus.circle.fill")
                Button("New Reminder") {
                    openAddReminder.toggle()
                }
        
            }//:HStack
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity , alignment: .leading)
            .padding()
        }//:VStack
        .alert("New Reminder" , isPresented: $openAddReminder) {
            TextField("",text:$title)
            Button("Cancel" , role: .cancel){ }
            Button("Done"){
                if isFormValid {
                    do {
                        try ReminderService.saveReminderToMylist(list: mylist, ReminderTitle: title)
                    }
                    catch {
                            print(error.localizedDescription)
                        }
                    }
                
            }
        }
    }
}

#Preview {
    MylistDetailView(mylist: PreviewData.myList)
}
