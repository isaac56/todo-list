//
//  DateManager.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/16.
//

import Foundation

class DateManager {
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale(identifier: "ko")
        return formatter
    }()
    
    static func toDate(_ date: String) -> Date {
        return DateManager.formatter.date(from: date) ?? Date()
    }
    
    static func intervalTime(historyTime: String) -> String {
        let time = DateManager.toDate(historyTime)
        return DateManager.timeLogic(intervalTime: Int(Date().timeIntervalSince(time)))
    }
    
    static func timeLogic(intervalTime: Int) -> String{
        if intervalTime < 60 {
            return "\(intervalTime)초 전"
        } else if intervalTime < 3600 {
            return "\(intervalTime/60)분 전"
        } else if intervalTime < 216000 {
            return "\(intervalTime/3600)시간 전"
        } else if intervalTime < 12960000 {
            return "\(intervalTime/216000) 일 전"
        } else {
            return "한달 이상 전"
        }
    }
}
