
import Foundation

class DataManager {
    
    static func decodeJsonBox(data: Data) -> [JsonCard] {
        let decoder = JSONDecoder()
        
        let cardBox = try? decoder.decode(JsonBox.self, from: data)
        if let card = cardBox?.data {
            return card
        } else {
            return []
        }
    }
    
    static func decodeHistoryBox(data: Data) -> [JsonHistory] {
        let decoder = JSONDecoder()
        
        let historyBox = try? decoder.decode(JsonHistoryBox.self, from: data)
        if let history = historyBox?.data {
            return history
        } else {
            return []
        }
    }
    
    static func decodeJsonResponseBox(data: Data) -> JsonCard? {
        let decoder = JSONDecoder()
        let cardBox = try? decoder.decode(JsonResponseBox.self, from: data)
        if let card = cardBox?.data {
            return card
        } else {
            return nil
        }
    }
    
    static func decode(data: Data) -> JsonResponseBox? {
        let decoder = JSONDecoder()
        let jsonResponseBox = try? decoder.decode(JsonResponseBox.self, from: data)
        if let jsonResponseBox = jsonResponseBox {
            return jsonResponseBox
        } else {
            return nil
        }
    }
    
    static func decodeMoveResponse(data: Data) -> JsonMoveResponseBox? {
        let decoder = JSONDecoder()
        let jsonMoveResponseBox = try? decoder.decode(JsonMoveResponseBox.self, from: data)
        if let jsonMoveResponseBox = jsonMoveResponseBox {
            return jsonMoveResponseBox
        } else {
            return nil
        }
    }
    
    static func encode(card: Card) -> Data? {
        let encoder = JSONEncoder()
        let jsonCard = postJsonCard(title: card.title, content: card.body, columnType: statesToInt(states: card.states))
        
        let encodedCard = try? encoder.encode(jsonCard)
        if let encodedCard = encodedCard {
            return encodedCard
        } else {
            return nil
        }
    }
    
    static func encode(movingInfo: MovingInfo) -> Data? {
        let encoder = JSONEncoder()
        let encodedInfo = try? encoder.encode(movingInfo)
        if let encodedInfo = encodedInfo {
            return encodedInfo
        } else {
            return nil
        }
    }
    
    static func encode(editedCard: Card) -> Data? {
        let encoder = JSONEncoder()
        let jsonEditCard = JsonEditCard(title: editedCard.title, content: editedCard.body, priority: editedCard.priority)
        let encodedInfo = try? encoder.encode(jsonEditCard)
        
        if let encodedCard = encodedInfo {
            return encodedCard
        } else {
            return nil
        }
    }
    
    static func statesToInt(states: States) -> Int {
        switch states {
        case .ToDo:
            return 0
        case .InProgress:
            return 1
        case .Done:
            return 2
        }
    }
    
    static func intToStates(value: Int) -> States {
        switch value {
        case 0:
            return .ToDo
        case 1:
            return .InProgress
        case 2:
            return .Done
        default:
            return .ToDo
        }
    }
    
    static func statesToString(states: States) -> String {
        switch states {
        case .Done:
            return "done"
        case .InProgress:
            return "doing"
        case .ToDo:
            return "todo"
        }
    }
}
