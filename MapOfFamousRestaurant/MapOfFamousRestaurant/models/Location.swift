import Foundation

// 전체 주소 응답 프로토콜
// GET /locations

struct LocationList: Codable {
    let id: Int
    let longitude: Double?
    let latitude: Double?
    let name: String?
    let description: String?
    let address: String?
    
}
