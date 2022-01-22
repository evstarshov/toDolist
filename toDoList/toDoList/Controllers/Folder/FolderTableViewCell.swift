//
//  FolderTableViewCell.swift
//  toDoList
//
//  Created by Евгений Старшов on 22.01.2022.
//

import UIKit

class FolderTableViewCell: UITableViewCell {

    @IBOutlet weak var folderName: UILabel!
    @IBOutlet weak var decriptionName: UILabel!
    @IBOutlet weak var addTaskButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureFolder(with viewModel: FolderViewModel) {
        folderName.text = viewModel.name
        decriptionName.text = viewModel.description
    }

}
