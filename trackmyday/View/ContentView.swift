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
            VStack {
                if allTodos.test.count == 0 {
                    ifEmptyTodoList()
                }
                else {
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
                }
            }
            .navigationTitle("Todo List")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add", destination: AddTodo())
                }
            }
        }
    }
}

struct ifEmptyTodoList: View {
    var body: some View {
        HStack
        {
            Text("Click")
            Text("Add")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.blue)
            Text("to enter your first task!")
        }
        .padding(.top)
    }
}

#Preview {
    ContentView()
        .environmentObject(TodoDataModel())
}
