//
//  TodoListApp.swift
//  TodoList
//
//  Created by PC-Ali on 5/21/24.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }.environmentObject(listViewModel)
//            ContentView()
        }
    }
}
