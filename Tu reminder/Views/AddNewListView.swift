//
//  AddNewListView.swift
//  Tu reminder
//
//  Created by Ahmed El Gndy on 30/12/2024.
//

import SwiftUI

struct AddNewListView: View {
    //MARK: PROPERTIES
    @Environment(\.dismiss) private var dismiss
    @State private var name : String = ""
    @State private var SelectedColor : Color = .yellow
    
    let onSave:(String, UIColor)-> Void
    
    private var isFormValid: Bool {
        !name.isEmpty
    }
    //MARK: BODY
    var body: some View {
        VStack {
            //1- Icon
            Image(systemName: "line.3.horizontal.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(SelectedColor)
            //2- TextField
            TextField("List Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
            //3- Color Picker
            ColorPickerView(selectedColor: $SelectedColor )
            
            Spacer()
        }//:STack
        .padding(30)
        .frame(maxWidth: .infinity , maxHeight:  .infinity)
        //close
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Add new list")
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                
                    Button("Done") {
                        //MARK: on Save
                        onSave(name, UIColor(SelectedColor))
                        dismiss()
                    }
                    .disabled(!isFormValid)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddNewListView(onSave: {(_,_) in })
    }
}
