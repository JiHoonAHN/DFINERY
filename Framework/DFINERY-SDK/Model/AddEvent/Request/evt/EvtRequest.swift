import Foundation

public struct EvtDTO : Codable{
    let createdAt : String
    let event : String
    let location : LocationDTO?
    let param : ParamDTO
    let userProperties : UserPropertiesDTO
    
    enum CodingKeys : String, CodingKey{
        case createdAt = "created_at"
        case userProperties = "user_properties"
        case event, param, location
    }
}
