//
//  Uitility.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/08.
//

import Foundation

enum States: String {
    case ToDo = "todo"
    case InProgress = "doing"
    case Done = "done"
}

enum NotificationUserInfoKey {
    static let needUpdateStatees = "needUpdateStates"
}

enum ContextMenu {
    static let MoveToDone = "완료한 일로 이동"
    static let Edit = "수정하기"
    static let Delete = "삭제하기"
}

enum Action: String {
    case Add = "ADD"
    case Move = "MOVE"
    case Remove = "REMOVE"
    case Update = "UPDATE"
}

class RandomNameFactory {
    private (set) var name: String
    
    static let shared = RandomNameFactory()
    
    private init() {
        self.name = ""
        self.name = self.getName()
    }
    
    private func getName() -> String {
        let names = ["BMO", "Dumba", "아이작", "노을"]
        return names.randomElement()!
    }
}
