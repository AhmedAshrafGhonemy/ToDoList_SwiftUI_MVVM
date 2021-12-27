//
//  AddView.swift
//  ToDoList
//
//  Created by macbook on 12/12/2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModed : ListViewModel
    @State var textFieldText: String = ""
    @State var AlertTitle : String = ""
    @State var showAlert : Bool = false
    var body: some View {
        ScrollView {
           
            VStack {
                TextField("Add Here", text: $textFieldText)
                    .frame(height:80)
                    .padding(.horizontal)
                .background(Color(hue: 1.0, saturation: 0.019, brightness: 0.827))
                .cornerRadius(10)
                
                Button(action: saveButton , label: {
                    Text("SAVE")
                   .foregroundColor(.white)
                   .frame(height : 50)
                   .frame(maxWidth : .infinity)
                   .background(Color.accentColor)
                   .cornerRadius(10)
                })
                    .padding(.vertical)
                    
            }
            .padding(.all)
    
        }
        .navigationTitle("Add Item ✒️")
        .alert(isPresented: $showAlert, content: getAlert)
        
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            AlertTitle = "item mut be 3 charcaters or more"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func saveButton (){
        if textIsAppropriate() {
            
            listViewModed.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
            
        }
    }
    
    func getAlert () -> Alert{
        
        return Alert(title: Text(AlertTitle))
                     
        }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()

        }
        .environmentObject(ListViewModel())
    }
}
