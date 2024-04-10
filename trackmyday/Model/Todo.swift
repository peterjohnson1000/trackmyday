//
//  Todo.swift
//  trackmyday
//
//  Created by Peter Johnson on 4/6/24.
//

import Foundation

struct Todo: Hashable, Identifiable, Codable {
    var id = UUID().uuidString
    var todo: String
    var isCompleted: Bool
}
