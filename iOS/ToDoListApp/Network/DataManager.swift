
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
        let jsonCard = postJsonCard(title: card.title, content: card.body, columnType: card.states.rawValue.uppercased())
        
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
}
