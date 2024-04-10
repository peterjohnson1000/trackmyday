//
//  TodoDataModel.swift
//  trackmyday
//
//  Created by Peter Johnson on 4/7/24.
//

import Foundation
import SwiftUI

class TodoDataModel: ObservableObject {
    
    @Published var test: [Todo] = [
        Todo(todo: "drink water", isCompleted: false),
        Todo(todo: "take a bath", isCompleted: false),
        Todo(todo: "pray", isCompleted: false)
    ]
    
    func appendNewTodo(newTodo: String) {
        test.append(Todo(todo: newTodo, isCompleted: false))
    }
    
    func deleteTodo(indexSet: IndexSet) {
        test.remove(atOffsets: indexSet)
    }
    
    func moveTodo(from: IndexSet, to: Int) {
        test.move(fromOffsets: from, toOffset: to)
    }
    
    func todoCompleted(todoID: String) {
        for index in test.indices {
            if test[index].id == todoID {
                test[index].isCompleted.toggle()
            }
        }
    }
}
