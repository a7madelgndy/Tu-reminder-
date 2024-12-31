//
//  MyListCellView.swift
//  Tu reminder
//
//  Created by Ahmed El Gndy on 31/12/2024.
//

import SwiftUI

struct MyListCellView: View {
    var list : MyList
    var body: some View {
        HStack{
            Image(systemName: "line.3.horizontal.circle.fill")
                .foregroundColor(Color(list.color))
            Text(list.name)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .opacity(0.4)
                .padding(.trailing, 10)
        }//:HSTACK

    }
}

#Preview {
    MyListCellView(list: PreviewData.myList)
}
