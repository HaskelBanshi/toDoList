//
//  TaskCell.swift
//  toDoList
//
//  Created by a2 on 03.07.2022.
//

import UIKit

class TaskCell: UITableViewCell {
    @IBOutlet weak var CellView: UIView!
    @IBOutlet weak var SomeText: UILabel!
    weak var removeTaskDelegate: RemoveTaskDelegate?
    weak var taskCompletedDelegate: TaskCompletedDelegate?
    var task: TaskModel?
    

    
    func cellData (task: TaskModel) {
        SomeText.text = task.taskName
        CellView.backgroundColor = task.taskCellColor
        self.task = task
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func removeTaskButtonPressed(_ sender: Any) {
        guard let task = task else { return }
           removeTaskDelegate?.removeTask(task: task)
    }
    
    @IBAction func executeTaskButtonPressed(_ sender: Any) {
        guard let task = task else { return }
            taskCompletedDelegate?.taskComplet(task: task)
    }
}
