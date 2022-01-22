//
//  TasksTableTableViewController.swift
//  toDoList
//
//  Created by Евгений Старшов on 22.01.2022.
//

import UIKit

class FolderTableViewController: UITableViewController {
    
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
        print("Folder appended")
        addFolder()
    }
    
    private func addFolder() {
        let textController = UIAlertController(title: "Enter folder name", message: nil, preferredStyle: .alert)
        textController.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned textController] _ in
            let answer = textController.textFields![0]
            self.folders.append(TaskFolder(name: answer.text ?? "no name"))
            self.folderViewModels = self.folderFactory.constructViewModels(from: self.folders)
            print("Appending folder \(answer.text ?? "empty name")")
            self.tableView.reloadData()
        }
        textController.addAction(submitAction)
        present(textController, animated: true)
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
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Openning task VC")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TaskController") as! TaskTableViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
   
    
}
