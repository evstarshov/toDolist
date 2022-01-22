//
//  TasksTableTableViewController.swift
//  toDoList
//
//  Created by Евгений Старшов on 22.01.2022.
//

import UIKit

class TasksTableTableViewController: UITableViewController {
    
    @IBOutlet weak var AddFolder: UIBarButtonItem!
    
    private let folderFactory = FolderViewModelFactory()
    private var folderViewModels: [FolderViewModel] = [FolderViewModel(name: "test name", description: "test description")]
    
    var folders: [TaskFolder] = []
    var tasks: [MainTask] = []
    var subTasks: [SubTask] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        print("Taking Folders")
        makeSection()
        //folderViewModels = { folderFactory.constructViewModels(from: folders) }()
        tableView.reloadData()
    }
    


    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return folderViewModels.count
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return folderViewModels.count
    }
    
    @IBAction func addFolderButtonTapped(_ sender: UIBarButtonItem!) {
        addFolder()
        print("Folder appended")
        makeSection()
        tableView.reloadData()
    }
    
    private func addFolder() {
        let textController = UIAlertController(title: "Enter folder name", message: nil, preferredStyle: .alert)
        textController.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned textController] _ in
            let answer = textController.textFields![0]
            self.folders.append(TaskFolder(name: answer.text ?? "no name"))
            self.folderViewModels = self.folderFactory.constructViewModels(from: self.folders)
            print("Appending folder \(answer.text ?? "empty name")")
        }
        textController.addAction(submitAction)
        present(textController, animated: true)
        tableView.reloadData()
    }
    
    private func makeSection() {
        print("Making section")
        let folderNib = UINib(nibName: "FolderTableViewCell", bundle: nil)
        self.tableView.register(folderNib, forCellReuseIdentifier: "folderCell")
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "folderCell", for: indexPath) as! FolderTableViewCell

        cell.configureFolder(with: folderViewModels[indexPath.row])

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
