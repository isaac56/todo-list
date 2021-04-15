//
//  HistoryCell.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/15.
//

import UIKit

class HistoryCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()

        self.selectionStyle = .none
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
