//
//  HistoryTableView.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/15.
//

import UIKit

class HistoryTableView: UITableView {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCell()
    }
    
    func configureCell() {
        let nibName = UINib(nibName: "HistoryCell", bundle: nil)
        self.register(nibName, forCellReuseIdentifier: "historyCell")
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = 137
        self.separatorStyle = .none
    }

}
