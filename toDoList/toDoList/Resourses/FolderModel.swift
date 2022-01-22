//
//  FolderModel.swift
//  toDoList
//
//  Created by Евгений Старшов on 22.01.2022.
//

import Foundation

class TaskFolder: TaskProtokol {
    
    var name: String
    var tasks: [MainTask] = []
    
    var description: String {
        let taskNames = tasks.compactMap {$0.description}.joined(separator: ",")
        return "Main Tasks \(name) with names: \(taskNames)"
    }
    
    init(name: String) {
        self.name = name
    }
    
    func open() {
        print("Opening \(description)")
        self.tasks.forEach {$0.open()}
    }
    
    func close() {
        print("Closing \(description)")
        self.tasks.forEach {$0.close()}
    }
    
    
}
