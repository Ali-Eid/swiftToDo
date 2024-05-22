//
//  ListRowView.swift
//  TodoList
//
//  Created by PC-Ali on 5/21/24.
//

import SwiftUI

struct ListRowView: View {
    var item:ItemModel
    var body: some View {
        HStack{
            Image(systemName:item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}


#Preview {
    ListRowView(item: ItemModel(title: "This is the first item!" ,isCompleted: false ))
}
