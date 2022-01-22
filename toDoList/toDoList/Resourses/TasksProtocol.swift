//
//  TasksProtocol.swift
//  toDoList
//
//  Created by Евгений Старшов on 22.01.2022.
//

import Foundation


protocol TaskProtokol {
    var name: String { get }
    var description: String { get }
    func open()
    func close()
}

enum TaskStatus {
    case opened
    case closed
}
