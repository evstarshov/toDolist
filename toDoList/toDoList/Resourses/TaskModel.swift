//
//  TaskModel.swift
//  toDoList
//
//  Created by Евгений Старшов on 22.01.2022.
//

import Foundation


class MainTask: TaskProtokol {
    
    var name: String
    
    var description: String
    
    var status: TaskStatus
    
    init(name: String, description: String, status: TaskStatus) {
        self.name = name
        self.description = description
        self.status = status
    }
    
    func open() {
        status = .opened
    }
    
    func close() {
        status = .closed
    }
}

class SubTask: TaskProtokol {
    
    var name: String
    
    var description: String
    
    var status: TaskStatus
    
    init(name: String, description: String, status: TaskStatus) {
        self.name = name
        self.description = description
        self.status = status
    }
    
    func open() {
        status = .opened
    }
    
    func close() {
        status = .closed
    }
}
