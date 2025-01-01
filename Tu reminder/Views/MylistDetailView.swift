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
    @State private var title : String = ""
    
    @FetchRequest(sortDescriptors: [])
    private var reminderResults: FetchedResults<Reminder>
    
    private var isFormValid: Bool {
        !title.isEmpty
    }
    
    init(list : MyList){
        mylist = list
        let request = ReminderService.getRemindersBylist(mylist: mylist)
        _reminderResults = FetchRequest(fetchRequest: request)
    }
    //MARK: BODY
    var body: some View {
        VStack {
            ReminderListView(reminders: reminderResults)
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

struct MyListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MylistDetailView(list: PreviewData.myList)
    }
}

