import Foundation

struct CommonDTO : Codable{
    let identity : IdentityDTO
    let deviceInfo : DeviceInfoDTO
    let packageName : String
    let appkey : String
    
    enum CodingKeys : String, CodingKey{
        case packageName = "package_name"
        case deviceInfo = "device_info"
        case appkey, identity
    }
}
