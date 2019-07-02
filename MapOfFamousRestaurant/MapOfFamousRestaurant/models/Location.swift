import Foundation

// 전체 주소 응답 프로토콜
// GET /locations

struct LocationList: Codable {
    struct CustomData: Codable {
        let rating: Double?
    }
    let id: Int
    let longitude: Double?
    let latitude: Double?
    let name: String?
    let description: String?
    let address: String?
    let rating: CustomData?
    
}
