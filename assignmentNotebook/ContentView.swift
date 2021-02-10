//
//  ContentView.swift
//  assignmentNotebook
//
//  Created by Student on 2/8/21.
//

import SwiftUI

struct ContentView: View {
    @State var AssignmentItem = [""]
    var body: some View {
        NavigationView {
            List {
                ForEach(AssignmentItem, id: \.self) { AssignmentItem in
                    Text(AssignmentItem)
                }
                .onMove(perform: { indices, newOffset in
                    AssignmentItem.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    AssignmentItem.remove(atOffsets: indexSet)
                                })
                
            }
            .navigationBarTitle("AssignmentItem")
            .navigationBarItems(leading: EditButton())
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct AssignmentItem: Identifiable {
    var id = UUID()
    var course = String()
    var  description = String()
    var dueDate = Date()
}


