//
//  SideBarViewController.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/15.
//

import UIKit

class SideBarViewController: UIViewController {
    
    @IBOutlet weak var historyTableView: HistoryTableView!
    
    private var historyManager = HistoryManager()
    private var historyTableViewDataSource = HistoryTableViewDataSource()
    private var historyTableViewDelegate = HistoryTableViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.delegate = historyTableViewDelegate
        historyTableViewDataSource.historyManager = self.historyManager
        historyTableView.dataSource = historyTableViewDataSource
        
        NotificationCenter.default.addObserver(self, selector: #selector(completeLoadHistory(_:)), name: HistoryManager.completeLoadHistory, object: historyManager)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    func completeLoadHistory(_ notification: Notification) {
        self.historyTableView.reloadData()
    }
}

