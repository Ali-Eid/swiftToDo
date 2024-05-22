//
//  AddView.swift
//  TodoList
//
//  Created by PC-Ali on 5/21/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText : String = ""
    @State var showAlert : Bool = false
    @State var alertTitle : String = ""
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here ....", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Button(action: savedButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }.padding(14)
            
        }.navigationTitle("Add an item 🖊️")
            .alert(alertTitle, isPresented: $showAlert, actions: {})
    }
    
    func savedButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool{
        if(textFieldText.count < 3){
            showAlert.toggle()
            alertTitle = "Your new todo item must be at least 3 characters long !!! 😱"
            return false
        }
        return true
    }
}

#Preview {
    NavigationView{
        AddView()
    }
}
