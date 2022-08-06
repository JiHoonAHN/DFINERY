import Foundation

struct DeviceInfoDTO : Encodable{
    let os : String
    let model : String
    let resolution : String
    let isPortrait : Bool
    let platform : String
    let network : String
    let carrier : String
    let language : String
    let country : String
    
    enum CodingKeys : String, CodingKey{
        case os, model, resolution, platform, network, carrier, language, country
        case isPortrait = "is_portrait"
    }
}
