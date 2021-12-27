//
//  ListView.swift
//  ToDoList
//
//  Created by macbook on 12/12/2021.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModed : ListViewModel
        
    
    var body: some View {
        List{
            ForEach(listViewModed.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation (.linear){
                            listViewModed.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModed.deleteItem)
            .onMove(perform: listViewModed.moveItem)
        }
        .navigationTitle("ToDo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:NavigationLink("ADD" , destination : AddView())
             )
        
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


