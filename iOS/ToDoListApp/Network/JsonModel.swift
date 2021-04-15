
import Foundation

// MARK: GET시 사용
struct JsonBox: Codable {
    let data: [JsonCard]
    let error: String?
}

// MARK: response시 사용
struct JsonResponseBox: Codable {
    let data: JsonCard
    let error: String?
}

// MARK: post시 사용
struct postJsonCard: Codable {
    let title: String
    let content: String
    let columnType: String
}

// MARK: Box 내부 Card
struct JsonCard: Codable {
    let id, user: Int
    let title, content: String
    let priority: Double
    let columnType: String
    let deleted: Bool
}

