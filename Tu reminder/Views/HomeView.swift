//
//  ContentView.swift
//  Tu reminder
//
//  Created by Ahmed El Gndy on 30/12/2024.
//

import SwiftUI

struct HomeView: View {
    //MARK: PROPERTIES
    @FetchRequest(sortDescriptors: [])
    private var myListsReguest : FetchedResults<MyList>
    
    @State private var isAddNewopen = false
    //MARK: BODY
    var body: some View {
        NavigationStack{
            VStack {
                //1- lists View
                MyListsView(lists: myListsReguest)
                //2- add new list 
                Button {
                    isAddNewopen.toggle()
                } label: {
                    Text("on add new ")
                }
                .sheet(isPresented: $isAddNewopen , content: {
                    NavigationView {
                        //MARK: save to core data
                        AddNewListView { title, color in
                            do {
                                try ReminderService.saveMyList(name: title, color: color)
                            }catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                })

            }
        }
   
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .environment(\.managedObjectContext , CoreDataProvider.shared.persistentContainer.viewContext)
    }
}
