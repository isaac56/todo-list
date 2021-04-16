//
//  Card.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/08.
//

import Foundation

class Card {
    var id: Int
    var title: String
    var body: String
    var author: String
    var date: Date
    var priority: Double
    var states: States
    
    init(id: Int, title: String, body: String, author: String, date: Date, priority: Double, states: States) {
        self.id = id
        self.title = title
        self.body = body
        self.author = author
        self.date = date
        self.priority = priority
        self.states = states
    }
    
    convenience init(title: String, body: String, states: States, id: Int = 0, priority: Double = 0) {
        let author = "author by iOS"
        let date = Date()
        self.init(id: id, title: title, body: body, author: author, date: date, priority: priority, states: states)
    }
}

struct DraggedCard {
    var cardInfo: Card
    var index: Int
}

struct ReverseIndex {
    static func get(with index:Int, total: Int) -> Int {
        return total - 1 - index
    }
}

struct MovingInfo : Codable {
    var prevCardId : Int?
    var nextCardId : Int?
    var to: String
    
    init() {
        self.prevCardId = nil
        self.nextCardId = nil
        self.to = ""
    }
}
