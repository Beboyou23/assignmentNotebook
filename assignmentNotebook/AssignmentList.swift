//
//  AssignmentList.swift
//  assignmentNotebook
//
//  Created by Student on 2/9/21.
//

import Foundation
class AssignmentList: ObservableObject {
    @Published var items = [AssignmentItem(course: "Math", description: "Homework", dueDate: Date())]
 }
