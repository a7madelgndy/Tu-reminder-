//
//  MyListsView.swift
//  Tu reminder
//
//  Created by Ahmed El Gndy on 31/12/2024.
//

import SwiftUI

struct MyListsView: View {
    //MARK : PROPRTIES
    var lists:FetchedResults<MyList>
    //MARK : BODY
    var body: some View {
        if lists.isEmpty {
            Text("No Reminders found")
        }else {
            ForEach(lists) { list in
                NavigationLink(value: list){
                    VStack {
                        MyListCellView(list: list)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding([.leading] , 10)
                            .font(.title3)
                        Divider()
                    }//:VStack
                    .padding([.leading , .trailing] , 10)
                }//:NavigationLink
   
            }//ForEach
            .navigationDestination(for: MyList.self) { list in
                MylistDetailView(list:list )
                    .navigationTitle(list.name)
            }
        }
    }
}


