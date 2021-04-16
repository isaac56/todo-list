//
//  CardManager.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/08.
//

import Foundation

protocol CardManageDelegate {
    func count(states: States) -> Int
    func setCell(states: States, index: Int, handler: (Card)->())
    func add(card: Card)
    func remove(states: States, at index: Int)
}

class CardManager: CardManageDelegate {
    
    var cardDic: Dictionary<States, [Card]>
    
    static let shared = CardManager()
    
    private init() {
        self.cardDic = [:]
        self.cardDic[.ToDo] = []
        self.cardDic[.InProgress] = []
        self.cardDic[.Done] = []
    }
    
    func count(states: States) -> Int {
        return self.cardDic[states]?.count ?? 0
    }
    
    func setCell(states:States, index: Int, handler: (Card) -> ()) {
        guard let cards = cardDic[states], !cards.isEmpty else {
            return
        }
        let count = cards.count - 1
        handler(cards[count - index])
    }
    
    func add(card: Card) {
        self.cardDic[card.states]?.append(card)
        NotificationCenter.default.post(name: CardManager.changeCardCount, object: self, userInfo: [NotificationUserInfoKey.needUpdateStatees:card.states])
    }
    
    func remove(states: States, at index: Int) {

        let id = self.cardDic[states]![index].id
        NetworkManager.delete(id: id) { completion in
            if completion {
                self.cardDic[states]!.remove(at: index)
                NotificationCenter.default.post(name: CardManager.changeCardCount, object: self, userInfo: [NotificationUserInfoKey.needUpdateStatees:states])
            }
        }
    }
    
    func insert(at index: Int, card: Card) {
        self.cardDic[card.states]?.insert(card, at: index)
        NotificationCenter.default.post(name: CardManager.changeCardCount, object: self, userInfo: [NotificationUserInfoKey.needUpdateStatees:card.states])
    }
    
    func getCard(states: States, at index: Int) -> Card {
        guard let cards = cardDic[states] else {
            return Card(title: "", body: "", states: .InProgress)
        }
        return cards[index]
    }
    
    func moveCard(draggedCard: DraggedCard, destinationIndexPath: IndexPath, destinationIdentifier: States) {
        let card = draggedCard.cardInfo
        let sourceIndex = ReverseIndex.get(with: draggedCard.index, total: self.count(states: card.states))
        let sourceState = card.states
        print("origin destination: \(destinationIndexPath.section)")
        let destinationIndex = ReverseIndex.get(with: destinationIndexPath.section, total: self.count(states: destinationIdentifier)) + 1
        
        card.states = destinationIdentifier
        
        print("source: \(sourceIndex) -> destination: \(destinationIndex)")
        self.remove(states: sourceState, at: sourceIndex)
        self.insert(at: destinationIndex, card: card)
    }
}

extension CardManager {
    static let changeCardCount = Notification.Name("changeCardCount")
    static let cardMove = Notification.Name("cardMove")
}
