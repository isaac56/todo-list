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
