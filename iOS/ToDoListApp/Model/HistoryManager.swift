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
        print(history.action)
        switch history.action {
        case 0:
            return addHistoryForm(with: history)
        case 1:
            return removeHistoryForm(with: history)
        case 2:
            return updateHistoryForm(with: history)
        case 3:
            return moveHistoryForm(with: history)
        default:
            return "Error"
        }
    }
    
    func addHistoryForm(with history: JsonHistory) -> String {
        let states = self.swtichStates(states: history.to)
        return "\(states)에 \(history.cardTitle)을(를) 등록하였습니다."
    }
    
    func moveHistoryForm(with history: JsonHistory) -> String {
        let from = swtichStates(states: history.from!)
        let to = swtichStates(states: history.to!)
        
        return "\(history.cardTitle) 을(를) \(from)에서 \(to)로 이동하였습니다."
    }
    
    func removeHistoryForm(with history: JsonHistory) -> String {
        let states = self.swtichStates(states: history.to)
        return "\(states)에서 \(history.cardTitle)을(를) 삭제하였습니다."
    }
    
    func updateHistoryForm(with history: JsonHistory) -> String {
        let states = self.swtichStates(states: history.to)
        return "\(states)에서 \(history.cardTitle)을(를) 수정하였습니다."
    }
    
    func swtichStates(states: Int?) -> String {
        switch states {
        case 0:
            return "해야할 일"
        case 1:
            return "하고 있는 일"
        case 2:
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
