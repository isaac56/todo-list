//
//  HistoryTableViewDataSource.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/15.
//

import Foundation
import UIKit

class HistoryTableViewDataSource: NSObject, UITableViewDataSource {

    var historyManager: HistoryManager?
    var userName = RandomNameFactory.shared.name
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyManager?.count() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell") as? HistoryCell
        else {
            return UITableViewCell()
        }

        cell.historyImageView.image = historyManager?.setHistoryImage(at: indexPath.row)
        cell.author.text = userName
        cell.historyContents.text = historyManager?.getContents(index: indexPath.row)
        cell.aboutTime.text = historyManager?.intervalTime(at: indexPath.row)
        
        return cell
    }
}


