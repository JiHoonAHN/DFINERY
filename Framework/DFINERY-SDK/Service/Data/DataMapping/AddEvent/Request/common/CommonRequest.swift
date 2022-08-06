import Foundation

struct CommonReq : Encodable{
    let identity : IdentityReq
    let deviceInfo : DeviceInfoReq
    let packageName : String
    let appkey : String
    
    enum CodingKeys : String, CodingKey{
        case packageName = "package_name"
        case deviceInfo = "device_info"
        case appkey, identity
    }
}
