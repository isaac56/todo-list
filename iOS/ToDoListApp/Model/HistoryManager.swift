//
//  HistoryManager.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/15.
//

import Foundation
import UIKit

class HistoryManager {
    
    var historys: [JsonHistory]

    init() {
        self.historys = []
        NetworkManager.getHistoryList(historyDelegate: self)
    }
    
    func inputHistorys(with historys: [JsonHistory], completion: () -> ()) {
        self.historys = historys
        completion()
    }
    
    func count() -> Int {
        return historys.count
    }
    
    func getContents(index: Int) -> String? {
        return classify(with: historys[index])
    }
    
    func setHistoryImage(at index: Int) -> UIImage {
        let action = historys[index].action
        guard let image = UIImage(named: "\(action).png") else {
            return UIImage()
        }
        return image
    }
    
    func classify(with history: JsonHistory) -> String {
        switch history.action {
        case "ADD":
            return addHistoryForm(with: history)
        case "MOVE":
            return moveHistoryForm(with: history)
        case "REMOVE":
            return removeHistoryForm(with: history)
        case "UPDATE":
            return updateHistoryForm(with: history)
        default:
            return "Error"
        }
    }
    
    func addHistoryForm(with history: JsonHistory) -> String {
        let states = self.swtichStates(states: history.to)
        return "\(states)에 \(history.cardTitle)을(를) 등록하였습니다."
    }
    
    func moveHistoryForm(with history: JsonHistory) -> String {
        return "\(history.cardTitle) 을(를) \(history.from!)에서 \(history.to!)로 이동하였습니다."
    }
    
    func removeHistoryForm(with history: JsonHistory) -> String {
        let states = self.swtichStates(states: history.to)
        return "\(states)에서 \(history.cardTitle)을(를) 삭제하였습니다."
    }
    
    func updateHistoryForm(with history: JsonHistory) -> String {
        let states = self.swtichStates(states: history.to)
        return "\(states)에서 \(history.cardTitle)을(를) 수정하였습니다."
    }
    
    func swtichStates(states: String?) -> String {
        switch states {
        case "TODO":
            return "해야할 일"
        case "DOING":
            return "하고 있는 일"
        case "DONE":
            return "완료한 일"
        default:
            return "Error"
        }
    }
    
    func intervalTime(at index: Int) -> String {
        return DateManager.intervalTime(historyTime: historys[index].date) 
    }
}

extension HistoryManager {
    static let completeLoadHistory = Notification.Name("completeLoadHistory")
}
