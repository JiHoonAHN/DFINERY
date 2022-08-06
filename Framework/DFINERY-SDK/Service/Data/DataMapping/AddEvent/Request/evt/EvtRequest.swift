import Foundation

struct EvtReq : Encodable{
    let createdAt : String
    let event : String
    let location : LocationReq
    let param : ParamReq
    let userProperties : UserPropertiesReq
    
    
    enum CodingKeys : String, CodingKey{
        case createdAt = "created_at"
        case userProperties = "user_properties"
        case event, param
    }
}
