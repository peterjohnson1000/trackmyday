//
//  ContentView.swift
//  trackmyday
//
//  Created by Peter Johnson on 4/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var allTodos: TodoDataModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(allTodos.test) { data in
                    HStack {
                        Image(systemName: data.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(data.isCompleted ? .green : .gray)
                        Text(data.todo)
                            .strikethrough(data.isCompleted ? true : false)
                    }
                    .onTapGesture {
                        allTodos.todoCompleted(todoID: data.id)
                    }
                }
                .onDelete(perform: allTodos.deleteTodo)
                .onMove(perform: allTodos.moveTodo)
            }
            .navigationTitle("Todo")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink("Edit", destination: Text("Edit"))
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add", destination: AddTodo())
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(TodoDataModel())
}
