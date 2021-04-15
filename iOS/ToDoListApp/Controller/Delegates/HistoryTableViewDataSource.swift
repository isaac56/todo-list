//
//  HistoryTableViewDataSource.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/15.
//

import Foundation
import UIKit

class HistoryTableViewDataSource: NSObject, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell") as? HistoryCell
        else {
            return UITableViewCell()
        }
        return cell
    }
}
