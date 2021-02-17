//
//  AddAssignmentView.swift
//  assignmentNotebook
//
//  Created by Student on 2/15/21.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var priority = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let priorites = ["High", "Medium", "Low"]
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Priority", selection: $priority){
                    ForEach(Self.priorites, id: \.self) { priority in Text(priority)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New Assignment Item")
            .navigationBarItems(trailing: Button("Save"){
                if(priority.count > 0 && description.count > 0) {
                    let item = AssignmentItem(id:UUID(),
                                        description: description,
                                        dueDate: dueDate)
                    assignmentList.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}
    
    struct AddAssignmentView_Previews: PreviewProvider {
        static var previews: some View {
            AddAssignmentView(assignmentList: AssignmentList())
        }
    }
