//
//  HistoryTableViewDelegate.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/15.
//

import Foundation
import UIKit

class HistoryTableViewDelegate: NSObject, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.systemGray6
    }
    
}
