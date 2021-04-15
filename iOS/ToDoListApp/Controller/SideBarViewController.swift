//
//  SideBarViewController.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/15.
//

import UIKit

class SideBarViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var historyTableView: HistoryTableView!
    
    private var historyTableViewDataSource = HistoryTableViewDataSource()
    private var historyTalbeViewDelegate = HistoryTableViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.delegate = self
        historyTableView.dataSource = historyTableViewDataSource
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
