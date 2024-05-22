//
//  ListView.swift
//  TodoList
//
//  Created by PC-Ali on 5/21/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                NoItemsView().transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List{
                    ForEach(listViewModel.items){
                        item in
                        ListRowView(item: item).onTapGesture {
                            withAnimation{
                                listViewModel.updateItem(item: item)
                            }
                        }
                    }
                    .onDelete(perform: listViewModel.deleteItetm)
                    .onMove(perform:listViewModel.moveItem)
                    
                }.listStyle(.plain)
            }
        }
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
        .navigationTitle("Todo List 📝")
    }
}

#Preview {
    NavigationView{
        ListView()
    }.environmentObject(ListViewModel())
}

