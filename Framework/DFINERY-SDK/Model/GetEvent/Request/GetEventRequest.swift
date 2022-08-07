import Foundation
//MARK: - Model
struct GetEventDTO: Codable{
    let appkey : String
    let length : Int
}
//MARK: - Request
struct GetEventRequest: Request{
    typealias ReturnType = [GetEventDTO]
    var path: String = "/GetEvent"
}
