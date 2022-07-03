//
//  TaskListTVC.swift
//  toDoList
//
//  Created by a2 on 03.07.2022.
//

import UIKit

class TaskListTVC: UITableViewController {

    var vc = TaskCViewController()
    var arrayUserTasks = [TaskModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayUserTasks.count
    }
    
    
    @IBAction func showTaskVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            vc = storyboard.instantiateViewController(withIdentifier: "TaskVC") as! TaskCViewController
        vc.saveTaskDeleagate = self
            present(vc, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? TaskCell else { return UITableViewCell() }
        
        arrayUserTasks[indexPath.row].curentIndex = indexPath
            let task = arrayUserTasks[indexPath.row]
        cell.cellData(task: task)
        cell.removeTaskDelegate = self
        cell.taskCompletedDelegate = self

        // Configure the cell...

        return cell
    }
    
    
    
    


    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TaskListTVC: SaveUserTaskDelegate {
  func saveTask(task: TaskModel) {
    arrayUserTasks.append(task)
    tableView.reloadData()
  }
}

extension TaskListTVC: RemoveTaskDelegate {
  func removeTask(task: TaskModel) {
    guard let taskByIndex = task.curentIndex?.item else { return }
    arrayUserTasks.remove(at: taskByIndex)
    tableView.reloadData()
  }
}
 
extension TaskListTVC: TaskCompletedDelegate {
  func taskComplet(task: TaskModel) {
    guard let taskByIndex = task.curentIndex?.item else { return }
    arrayUserTasks[taskByIndex].taskCellColor = #colorLiteral (red: 0.4666666667, green: 0.7607843137, blue: 0.7019607843, alpha: 1)
    tableView.reloadData()
  }
}



