
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
    
    static func stringToStates(string: String) -> States {
        switch string {
        case "TODO":
            return .ToDo
        case "DOING":
            return .InProgress
        case "DONE":
            return .Done
        default:
            return .ToDo
        }
    }
}
