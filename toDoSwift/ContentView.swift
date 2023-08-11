//
//  ContentView.swift
//  toDoSwift
//
//  Created by Kingthed💛💙 💂🏾‍♀️ on 8/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var fruits: [String] = [
    "apple", "orange", "banana","peach"
    ]
    @State private var text:String = ""
    var body: some View {
        NavigationStack {
            
         groceryTextField
            List {
                sectionView
            }
            .listStyle(.sidebar)
            .navigationTitle("Grocery List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                         addButton
                }
                
            }
        }
    }
    
    var sectionView: some View{
        Section {
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit.capitalized)
            }
            .onDelete { index in
                delete(index: index)
                
            }
            //keep the change
            .onMove { indexT, new in
               move(i: indexT, new: new)
            }
        } header: {Text("fruits")}
    }
    
    var groceryTextField: some View {
        Capsule()
             .stroke()
             .overlay(content: {
                 TextField("Add", text: $text)
                     .padding()
             })
             .frame(width: 300, height: 40)
    }
    
 
    var addButton: some View {
        Button("Add") {
          Add()
        }
    }
    
    func delete(index: IndexSet){
        fruits.remove(atOffsets: index)
    }
    
    func move(i:IndexSet, new:Int){
        fruits.move(fromOffsets: i, toOffset: new)
    }

    func Add(){
        fruits.append(text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
