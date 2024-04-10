//
//  AddTodo.swift
//  trackmyday
//
//  Created by Peter Johnson on 4/9/24.
//

import SwiftUI

struct AddTodo: View {
    
    @EnvironmentObject var allTodos: TodoDataModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            TextField("Enter your task", text: $textFieldText)
                .padding(.horizontal)
                .frame(height:55)
                .background(Color(hex:"#f9f9f9"))
                .cornerRadius(10)
            
            Button(action: {
                if textFieldText.count >= 3 {
                    allTodos.appendNewTodo(newTodo: textFieldText)
                    presentationMode.wrappedValue.dismiss()
                }
                else {
                    showAlert.toggle()
                }
            },
            label: {
                Text("Add")
            })
            .padding(.vertical)
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Add Todo")
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Please enter 3 charecters or more."))
        })
        
        Spacer()
    }
}

#Preview {
    NavigationStack {
        AddTodo()
            .environmentObject(TodoDataModel())
    }
}
