//
//  Todo.swift
//  trackmyday
//
//  Created by Peter Johnson on 4/6/24.
//

import Foundation

struct Todo: Hashable, Identifiable {
    let id = UUID().uuidString
    var todo: String
    var isCompleted: Bool
}
