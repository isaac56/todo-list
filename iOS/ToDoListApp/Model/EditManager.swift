
import Foundation

class EditManager {
    private var editingCard : Card?
    private var index : Int?
    
    func receive(card: Card, index: Int) {
        self.editingCard = card
        self.index = index
    }
    
    func isEditMode() -> Bool {
        return self.editingCard != nil ? true : false
    }
    
    func editingTitle() -> String {
        if let card = editingCard {
            return card.title
        } else {
            return ""
        }
    }
    
    func editingContent() -> String {
        if let card = editingCard {
            return card.body
        } else {
            return ""
        }
    }
    
    func editingTitleLabel() -> String {
        let title = "카드 수정"
        return title
    }
    
    func editingButtonTitle() -> String {
        let title = "수정"
        return title
    }
    
    func editCard(title: String, content: String) {
        self.editingCard?.title = title
        self.editingCard?.body = content
    }
    
    func cardInfo() -> Card {
        return self.editingCard ?? Card(title: "", body: "", states: .Done)
    }
    
    func cardIndexInfo() -> Int {
        return self.index ?? 0
    }
}
