//
//  TodoDataModel.swift
//  trackmyday
//
//  Created by Peter Johnson on 4/7/24.
//

import Foundation
import SwiftUI

class TodoDataModel: ObservableObject {
    
    @Published var test: [Todo] = [] {
        didSet {
            saveItems()
        }
    }
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard 
            let data = UserDefaults.standard.data(forKey: "persistentTodo"),
            let decodedData = try? JSONDecoder().decode([Todo].self, from: data)
        else { return }
        
        self.test = decodedData
    }
    
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
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(test) {
            UserDefaults.standard.setValue(encodedData, forKey: "persistentTodo")
        }
    }
}
