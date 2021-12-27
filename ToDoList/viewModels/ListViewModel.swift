//
//  ListViewModel.swift
//  ToDoList
//
//  Created by macbook on 22/12/2021.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items : [itemModel] = []
    
    init() {
        getitems()
    }
    
    func getitems(){
        let newItems = [
            itemModel(title: "the first", isCompleted: false),
            itemModel(title: "the second", isCompleted: false),
            itemModel(title: "the third", isCompleted: false)

        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem (index : IndexSet){
        items.remove(atOffsets: index)
    }
    
    func moveItem (from : IndexSet , to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem (title : String){
        let newItem = itemModel(title: title, isCompleted: true)
        items.append(newItem)
    }
    
    func updateItem(item : itemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateComplition()
        }
    }
    
}
