//
//  ColorPickerView.swift
//  Tu reminder
//
//  Created by Ahmed El Gndy on 30/12/2024.
//

import SwiftUI

struct ColorPickerView: View {
    //MARK: PROPERTIES
    @Binding var selectedColor:Color
    let colors :[Color] = [.red ,.green ,.blue ,.yellow ,.orange ,  .purple]
    //MARK: BODY
    var body: some View {
        HStack {
            ForEach(colors ,id:\.self) { color in
                ZStack {
                    Circle()
                        .fill()
                        .foregroundStyle(color)
                        .padding(4)
                    
                    Circle()
                        .strokeBorder(selectedColor == color ? .gray :.clear ,lineWidth: 4)
                        .scaleEffect(1.2)
                }//:ZSTACK
                .onTapGesture {
                    selectedColor = color
                }
            }//:ForEach
        }//: HSTACK
        .padding()
        .frame(maxWidth:.infinity , maxHeight: 100)
    }
}

#Preview {
    ColorPickerView(selectedColor: .constant(.yellow))
}
