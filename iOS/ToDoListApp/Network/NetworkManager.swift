
import Foundation

class NetworkManager {
    
    //MARK: GET METHOD
    static func getAllCardList() {
        let httpMethod = "GET"
        
        getCardList(httpMethod: httpMethod, states: .ToDo)
        getCardList(httpMethod: httpMethod, states: .InProgress)
        getCardList(httpMethod: httpMethod, states: .Done)
    }
    
    static func getCardList(httpMethod: String, states: States) {
        let url = URL(string: "http://13.209.62.240:8080/api/cards/\(states.rawValue)")
        var request = URLRequest(url: url!)
        request.httpMethod = httpMethod
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            let jsonCards = DataManager.decodeJsonBox(data: data)
            DispatchQueue.main.async {
                for card in jsonCards {
                    CardManager.shared.add(card: Card(title: card.title, body: card.content, states: states, id: card.id, priority: card.priority))
                }
            }
        }.resume()
    }
    
    static func post(card: Card) {
        guard let httpBody = DataManager.encode(card: card) else {
            return
        }
        
        let url = URL(string: "http://13.209.62.240:8080/api/cards")
        let httpMethod = "POST"
        
        var request = URLRequest(url: url!)
        request.httpMethod = httpMethod
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,  let jsonCard = DataManager.decodeJsonResponseBox(data: data) else {
                return
            }
            card.id = jsonCard.id
        }.resume()
    }
    
    static func delete(id: Int, completion: @escaping (Bool) -> Void) {
        let url = URL(string: "http://13.209.62.240:8080/api/cards/\(id)")
        let httpMethod = "DELETE"
        
        var request = URLRequest(url: url!)
        request.httpMethod = httpMethod
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = DataManager.decode(data: data) else {
                DispatchQueue.main.async {
                    completion(true)
                }
                return
            }
            completion(false)
        }.resume()
    }
    
    static func move(movingInfo: MovingInfo, id: Int, completion: @escaping (Bool) -> Void) {
        let url = URL(string: "http://13.209.62.240:8080/api/cards/move/\(id)")
        let httpMethod = "PUT"
        var request = URLRequest(url: url!)
        request.httpMethod = httpMethod
        request.httpBody = DataManager.encode(movingInfo: movingInfo)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = DataManager.decodeMoveResponse(data: data) else {
                completion(false)
                return
            }
            if response.data.rebalanced {
                CardManager.shared.reset()
                getAllCardList()
                completion(false)
            }
            else if response.error == nil {
                DispatchQueue.main.async {
                    completion(true)
                }
            } else {
                completion(false)
            }
        }.resume()
    }
    
    static func edit(card: Card, completion: @escaping (Bool) -> Void) {
        let url = URL(string: "http://13.209.62.240:8080/api/cards/\(card.id)")
        let httpMethod = "PUT"
        var request = URLRequest(url: url!)
        request.httpMethod = httpMethod
        request.httpBody = DataManager.encode(editedCard: card)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = DataManager.decode(data: data) else {
                completion(false)
                return
            }
            if response.error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }.resume()
    }
}
