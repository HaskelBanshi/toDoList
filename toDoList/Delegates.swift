//
//  Delegates.swift
//  toDoList
//
//  Created by a2 on 03.07.2022.
//

import Foundation



protocol SaveUserTaskDelegate: class {
  func saveTask(task: TaskModel)
}

protocol RemoveTaskDelegate: class {
  func removeTask(task: TaskModel)
}
 
protocol TaskCompletedDelegate: class {
  func taskComplet(task: TaskModel)
}



