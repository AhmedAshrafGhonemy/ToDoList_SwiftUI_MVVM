//
//  ListRowView.swift
//  ToDoList
//
//  Created by macbook on 12/12/2021.
//

import SwiftUI

struct ListRowView: View {
    
    var item : itemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
        .padding(.vertical)
       
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = itemModel(title: "first item", isCompleted: true)
    static var item2 = itemModel(title: "secod item", isCompleted: false)

    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)

        }
        .previewLayout(.sizeThatFits)
    }
}
