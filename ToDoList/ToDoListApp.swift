//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by macbook on 06/12/2021.
//

import SwiftUI

@main
struct ToDoListApp: App {

    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
      
        }
    }
}
