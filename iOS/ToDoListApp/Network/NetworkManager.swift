
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
    
    static func getHistoryList(historyDelegate: HistoryManager) {
        let httpMethod = "GET"
        let url = URL(string: "http://13.209.62.240:8080/api/histories")
        var request = URLRequest(url: url!)
        request.httpMethod = httpMethod
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            let jsonHistorys = DataManager.decodeHistoryBox(data: data)
            
            DispatchQueue.main.async {
                historyDelegate.inputHistorys(with: jsonHistorys) {
                    NotificationCenter.default.post(name: HistoryManager.completeLoadHistory, object: historyDelegate)
                }
            }
        }.resume()
    }
}
