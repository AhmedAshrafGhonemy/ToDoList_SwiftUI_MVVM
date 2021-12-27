//
//  itemModel.swift
//  ToDoList
//
//  Created by macbook on 12/12/2021.
//

import Foundation

struct itemModel : Identifiable{
    let id : String
    let title : String
    let isCompleted : Bool
    
    init(id : String = UUID().uuidString , title : String , isCompleted : Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        
    }
    
    func updateComplition () -> itemModel{
        return itemModel(id: id, title: title, isCompleted: !isCompleted)
        
    }
}
