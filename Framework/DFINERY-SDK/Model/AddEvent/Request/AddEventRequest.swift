import Foundation

//MARK: - Model
public struct AddEventDTO: Codable{
    let evt : EvtDTO
    let common : CommonDTO
}
//MARK: - Request
struct AddEventRequest: Request{    
    typealias ReturnType = [AddEventDTO]
    var path: String = "/AddEvent"
    var method: HTTPMethod = .post
    var body: [String : Any]?
    init(body : [String: Any]){
        self.body = body
    }
}
