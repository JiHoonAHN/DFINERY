import Foundation

struct IdentityReq: Encodable{
    let adid : String
    let adidOptOut : Bool
    
    enum CodingKeys : String, CodingKey{
        case adid
        case adidOptOut = "adid_opt_out"
    }
}
