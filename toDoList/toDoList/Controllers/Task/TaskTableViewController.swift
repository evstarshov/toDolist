//
//  TaskTableViewController.swift
//  toDoList
//
//  Created by Евгений Старшов on 22.01.2022.
//

import UIKit

class TaskTableViewController: UITableViewController {
    
    @IBOutlet weak var addSubTask: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    private var tasks: [MainTask] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSection()
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //
    //        return 0
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        
        cell.configureTask(with: tasks[indexPath.row])
        
        return cell
    }
    
    private func makeSection() {
        print("Making section")
        let folderNib = UINib(nibName: "TaskTableViewCell", bundle: nil)
        self.tableView.register(folderNib, forCellReuseIdentifier: "taskCell")
    }
    
    @IBAction func backButtonTapped() {
        print("Openning folder VC")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TaskController") as! TaskTableViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func addTaskButtonTapped() {
        let textController = UIAlertController(title: "Enter task name", message: nil, preferredStyle: .alert)
        textController.addTextField()
        textController.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned textController] _ in
            let answerName = textController.textFields![0]
            let answerDesk = textController.textFields![1]
            self.tasks.append(MainTask(name: answerName.text ?? "no name", description: answerDesk.text ?? "no description", status: .opened))
            print("Appending task \(answerName.text ?? "empty name")")
            self.tableView.reloadData()
        }
        textController.addAction(submitAction)
        present(textController, animated: true)
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
