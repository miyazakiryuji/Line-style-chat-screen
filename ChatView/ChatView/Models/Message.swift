import Foundation

struct Message: Decodable {
    let id: String
    let text: String
    // 誰のチャットなのかを判断する
    let user: User
    let date: String
    let readed: Bool
}
