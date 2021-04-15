
import Foundation

class CardMaker {
    
    private var currentState: States!
    
    func change(state: States) {
        self.currentState = state
    }
    
    func makeCard(title: String, content: String) -> Card {
        return Card(title: title, body: content, states: currentState)
    }
}
